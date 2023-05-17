variable "workspace_resource_id" {
  description = "The full resource ID of the Log Analytics workspace with which the solution will be linked."
  type        = string
}

variable "mode" {
  type        = string
  description = "Is it a new table, or is an existing table being updated?"
  validation {
    condition     = contains(["Create", "Update"], var.mode)
    error_message = "Invalid input, options: \"Create\", \"Update\")."
  }
  default = "Create"
}

variable "tables" {
  type = map(object({
    plan                 = optional(string)
    description          = optional(string)
    displayName          = optional(string)
    retentionInDays      = optional(number)
    totalRetentionInDays = optional(number)
    columns = optional(list(object({
      name         = string
      type         = string
      description  = optional(string)
      displayName  = optional(string)
      dataTypeHint = optional(string)
    })))
  }))
  validation {
    condition = alltrue([
      for table in var.tables : anytrue([
        table.plan == "Basic",
        table.plan == "Analytics"
      ]) if lookup(table, "plan", null) != null
    ])
    error_message = "The plan must be either Basic or Analytics."
  }
  validation {
    condition = alltrue([
      for table in var.tables : anytrue([
        table.retentionInDays == -1,
        (table.retentionInDays >= 4 && table.retentionInDays <= 730)
      ]) if lookup(table, "retentionInDays", null) != null
    ])
    error_message = "The retentionInDays property must be -1 or between 4 and 730 days."
  }
  validation {
    condition = alltrue([
      for table in var.tables : anytrue([
        table.totalRetentionInDays == -1,
        (table.totalRetentionInDays >= 4 && table.totalRetentionInDays <= 2555)
      ]) if lookup(table, "totalRetentionInDays", null) != null
    ])
    error_message = "The totalRetentionInDays property must be -1 or between 4 and 2555 days."
  }
  validation {
    condition = alltrue([
      for table in var.tables : anytrue([
        for column in table.columns : contains(["boolean", "dateTime", "dynamic", "guid", "int", "long", "real", "string"], column.type) if lookup(column, "type", null) != null
      ]) if lookup(table, "columns", null) != null
    ])
    error_message = "The column.type property must be one of boolean, dateTime, dynamic, guid, int, long, real, or string."
  }
}
