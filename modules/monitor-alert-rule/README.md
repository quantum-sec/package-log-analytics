<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.2 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 3.53 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | ~> 3.53 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_monitor_action_group.action](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_action_group) | resource |
| [azurerm_monitor_metric_alert.alert](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_metric_alert) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_action"></a> [action](#input\_action) | Define a list of actions to trigger when an alert is triggered. | <pre>list(object({<br>    action_group_id    = string<br>    webhook_properties = optional(map(string))<br>  }))</pre> | `[]` | no |
| <a name="input_application_insights_web_test_location_availability_criteria"></a> [application\_insights\_web\_test\_location\_availability\_criteria](#input\_application\_insights\_web\_test\_location\_availability\_criteria) | A application\_insights\_web\_test\_location\_availability\_criteria block. | <pre>object({<br>    web_test_id           = string<br>    component_id          = string<br>    failed_location_count = number<br>  })</pre> | `null` | no |
| <a name="input_auto_mitigate"></a> [auto\_mitigate](#input\_auto\_mitigate) | Should the alerts in this Metric Alert be auto resolved? | `bool` | `true` | no |
| <a name="input_criteria"></a> [criteria](#input\_criteria) | One or more criteria blocks. | <pre>list(object({<br>    metric_namespace = string<br>    metric_name      = string<br>    aggregation      = string<br>    operator         = string<br>    threshold        = number<br>    dimension = optional(list(object({<br>      name     = string<br>      operator = string<br>      values   = list(string)<br>    })))<br>    skip_metric_validation = optional(bool)<br>  }))</pre> | `[]` | no |
| <a name="input_description"></a> [description](#input\_description) | The description of this Metric Alert. | `string` | `""` | no |
| <a name="input_dynamic_criteria"></a> [dynamic\_criteria](#input\_dynamic\_criteria) | A dynamic\_criteria block. | <pre>object({<br>    metric_namespace  = string<br>    metric_name       = string<br>    aggregation       = string<br>    operator          = string<br>    alert_sensitivity = string<br>    dimension = optional(list(object({<br>      name     = string<br>      operator = string<br>      values   = list(string)<br>    })))<br>    evaluation_total_count   = optional(number)<br>    evaluation_failure_count = optional(number)<br>    ignore_data_before       = optional(string)<br>    skip_metric_validation   = optional(bool)<br>  })</pre> | `null` | no |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | Should this Metric Alert be enabled? | `bool` | `true` | no |
| <a name="input_frequency"></a> [frequency](#input\_frequency) | The evaluation frequency of this Metric Alert, represented in ISO 8601 duration format. | `string` | `"PT1M"` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the Metric Alert. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group in which to create the Metric Alert instance. | `string` | n/a | yes |
| <a name="input_scopes"></a> [scopes](#input\_scopes) | Resource IDs at which the metric criteria should be applied. | `set(string)` | n/a | yes |
| <a name="input_severity"></a> [severity](#input\_severity) | The severity of this Metric Alert. | `number` | `3` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to the resource | `map(string)` | `{}` | no |
| <a name="input_target_resource_location"></a> [target\_resource\_location](#input\_target\_resource\_location) | The location of the target resource. | `string` | `""` | no |
| <a name="input_target_resource_type"></a> [target\_resource\_type](#input\_target\_resource\_type) | The resource type of the target resource. | `string` | `""` | no |
| <a name="input_webhook_url"></a> [webhook\_url](#input\_webhook\_url) | The URI where webhooks should be sent. | `string` | n/a | yes |
| <a name="input_window_size"></a> [window\_size](#input\_window\_size) | The period of time that is used to monitor alert activity, represented in ISO 8601 duration format. | `string` | `"PT5M"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The ID of the metric alert. |
<!-- END_TF_DOCS -->
