variable "name" {
  description = "The name of the saved search."
  type        = string
}

variable "category" {
  description = "The category under which the saved search will be displayed."
  type        = string
}

variable "log_analytics_workspace_id" {
  description = "The ID of the Log Analytics workspace with which the saved search will be associated."
  type        = string
}

variable "query" {
  description = "The KQL query for the saved search."
  type        = string
}

variable "function_parameters" {
  description = "A list of parameter definitions (strings) in the following format: `param_name:type=default_value`."
  type        = set(string)
  default     = null
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
  default     = {}
}
