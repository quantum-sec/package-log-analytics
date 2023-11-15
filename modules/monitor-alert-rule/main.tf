# ---------------------------------------------------------------------------------------------------------------------
# DEPLOY AN AZURE MONITOR ALERT RULE
# ---------------------------------------------------------------------------------------------------------------------

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.53"
    }
  }
  required_version = ">= 1.2"
  experiments      = [module_variable_optional_attrs]
}

resource "azurerm_monitor_metric_alert" "alert" {
  name                     = var.name
  resource_group_name      = var.resource_group_name
  scopes                   = var.scopes
  enabled                  = var.enabled
  auto_mitigate            = var.auto_mitigate
  description              = var.description
  frequency                = var.frequency
  severity                 = var.severity
  target_resource_type     = var.target_resource_type
  target_resource_location = var.target_resource_location
  window_size              = var.window_size
  tags                     = var.tags

  action {
    action_group_id = azurerm_monitor_action_group.action.id
  }

  dynamic "action" {
    for_each = var.action
    content {
      action_group_id    = action.value["action_group_id"]
      webhook_properties = action.value["webhook_properties"]
    }
  }

  dynamic "criteria" {
    for_each = var.criteria
    content {
      metric_namespace = criteria.value["metric_namespace"]
      metric_name      = criteria.value["metric_name"]
      aggregation      = criteria.value["aggregation"]
      operator         = criteria.value["operator"]
      threshold        = criteria.value["threshold"]
      dynamic "dimension" {
        for_each = criteria.value["dimension"] != null ? criteria.value["dimension"] : []
        content {
          name     = dimension.value["name"]
          operator = dimension.value["operator"]
          values   = dimension.value["values"]
        }
      }
      skip_metric_validation = criteria.value["skip_metric_validation"]
    }
  }

  dynamic "dynamic_criteria" {
    for_each = var.dynamic_criteria != null ? [var.dynamic_criteria] : []
    content {
      metric_namespace  = dynamic_criteria.value["metric_namespace"]
      metric_name       = dynamic_criteria.value["metric_name"]
      aggregation       = dynamic_criteria.value["aggregation"]
      operator          = dynamic_criteria.value["operator"]
      alert_sensitivity = dynamic_criteria.value["alert_sensitivity"]
      dynamic "dimension" {
        for_each = dynamic_criteria.value["dimension"] != null ? dynamic_criteria.value["dimension"] : []
        content {
          name     = dimension.value["name"]
          operator = dimension.value["operator"]
          values   = dimension.value["values"]
        }
      }
      evaluation_total_count   = dynamic_criteria.value["evaluation_total_count"]
      evaluation_failure_count = dynamic_criteria.value["evaluation_failure_count"]
      ignore_data_before       = dynamic_criteria.value["ignore_data_before"]
      skip_metric_validation   = dynamic_criteria.value["skip_metric_validation"]
    }
  }

  dynamic "application_insights_web_test_location_availability_criteria" {
    for_each = var.application_insights_web_test_location_availability_criteria != null ? [
      var.application_insights_web_test_location_availability_criteria
    ] : []
    content {
      web_test_id           = application_insights_web_test_location_availability_criteria.value["web_test_id"]
      component_id          = application_insights_web_test_location_availability_criteria.value["component_id"]
      failed_location_count = application_insights_web_test_location_availability_criteria.value["failed_location_count"]
    }
  }
}

#TODO: Move this to a separate module
resource "azurerm_monitor_action_group" "action" {
  name                = var.name
  resource_group_name = var.resource_group_name
  short_name          = var.name
  webhook_receiver {
    name                    = var.name
    service_uri             = var.webhook_url
    use_common_alert_schema = true
  }
}
