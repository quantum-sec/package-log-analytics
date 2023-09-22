# ---------------------------------------------------------------------------------------------------------------------
# DEPLOY A MICROSOFT SENTINEL PLAYBOOK
# ---------------------------------------------------------------------------------------------------------------------

terraform {
  required_version = ">= 1.2"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 2.22"
    }
    null = {
      source  = "hashicorp/null"
      version = "~> 3.2.1"
    }
  }
}

resource "null_resource" "template_hash" {
  # null_resource.parameters.id used to force recreation of module.azure_sentinel_playbooks via local.arm_deployment_name
  # this null_resource will get a new id when any of the triggers change
  triggers = {
    template_md5   = md5(var.playbook_template)
    parameters_md5 = md5(jsonencode(var.parameters_override))
  }
}

module "azure_sentinel_playbooks" {
  source = "git::git@github.com:quantum-sec/package-azure.git//modules/azure-arm-deployment?ref=1.6.1"

  depends_on = [
    null_resource.template_hash,
  ]

  # logic_app_name is not controlled via this name - this is the deployment
  name                = substr("${var.arm_deployment_name_prefix}-playbook-${null_resource.template_hash.id}", 0, 64)
  resource_group_name = var.resource_group_name
  deployment_mode     = "Incremental"

  # Note that updating this file after the initial deployment will fail to `apply` because the corresponding
  # parameters are not sent. You will need to first `destroy` then `apply` with the changes.
  # See https://github.com/terraform-providers/terraform-provider-azurerm/issues/8840
  arm_script          = var.playbook_template
  parameters_override = var.parameters_override
}

# ---------------------------------------------------------------------------------------------------------------------
# DATA SOURCE FOR AZURE ROLE ASSIGNMENT
# ---------------------------------------------------------------------------------------------------------------------

locals {
  playbooks_template_output = jsondecode(module.azure_sentinel_playbooks.output_content)
}

data "azuread_service_principal" "builtin_app" {
  count        = var.sentinel_principal_id == null ? 1 : 0
  display_name = "Azure Security Insights"
}

# ---------------------------------------------------------------------------------------------------------------------
# CREATE AZURE ROLE ASSIGNMENT FOR AZURE SECURITY INSIGHT APP
# ---------------------------------------------------------------------------------------------------------------------

module "azure_role_assignment" {
  source = "git::git@github.com:quantum-sec/package-azure.git//modules/azure-role-assignment?ref=1.6.1"

  depends_on = [
    module.azure_sentinel_playbooks,
  ]

  scope                = local.playbooks_template_output["logicAppId"]["value"]
  role_definition_name = var.role_definition_name
  principal_id         = coalesce(var.sentinel_principal_id, (can(data.azuread_service_principal.builtin_app[0].id) ? data.azuread_service_principal.builtin_app[0].id : null))
}
