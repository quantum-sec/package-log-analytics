variable "name" {
  description = "The name which should be used for this Policy Assignment"
  type        = string
}

variable "subscription_id" {
  description = "The ID of the Subscription where this policy assignment should be created"
  type        = string
}

variable "policy_definition_id" {
  description = "The ID of the Policy Definition of Policy Definition Set."
  type        = string
}
