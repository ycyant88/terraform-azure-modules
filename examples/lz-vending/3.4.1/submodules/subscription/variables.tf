variable "subscription_alias_enabled" {
  description = "Whether to create a new subscription using the subscription alias resource.\n\nIf enabled, the following must also be supplied:\n\n- subscription_alias_name\n- subscription_display_name\n- subscription_billing_scope\n- subscription_workload\n\nOptionally, supply the following to enable the placement of the subscription into a management group:\n\n- subscription_management_group_id\n- subscription_management_group_association_enabled\n\nIf disabled, supply the subscription_id variable to use an existing subscription instead.\n\n> **Note**: When the subscription is destroyed, this module will try to remove the NetworkWatcherRG resource group using az cli.\n> This requires the az cli tool be installed and authenticated.\n> If the command fails for any reason, the provider will attempt to cancel the subscription anyway.\n"
  type        = bool
  default     = false
}

variable "subscription_alias_name" {
  description = "The name of the subscription alias.\n\nThe string must be comprised of a-z, A-Z, 0-9, - and _.\nThe maximum length is 63 characters.\n\nYou may also supply an empty string if you do not want to create a new subscription alias.\nIn this scenario, subscription_enabled should be set to false and subscription_id must be supplied.\n"
  type        = string
  default     = ""
}

variable "subscription_billing_scope" {
  description = "The billing scope for the new subscription alias.\n\nA valid billing scope starts with /providers/Microsoft.Billing/billingAccounts/ and is case sensitive.\n\nE.g.\n\n- For CustomerLed and FieldLed, e.g. MCA - /providers/Microsoft.Billing/billingAccounts/{billingAccountName}/billingProfiles/{billingProfileName}/invoiceSections/{invoiceSectionName}\n- For PartnerLed, e.g. MPA - /providers/Microsoft.Billing/billingAccounts/{billingAccountName}/customers/{customerName}\n- For Legacy EA - /providers/Microsoft.Billing/billingAccounts/{billingAccountName}/enrollmentAccounts/{enrollmentAccountName}\n\nYou may also supply an empty string if you do not want to create a new subscription alias.\nIn this scenario, subscription_enabled should be set to false and subscription_id must be supplied.\n"
  type        = string
  default     = ""
}

variable "subscription_display_name" {
  description = "The display name of the subscription alias.\n\nThe string must be comprised of a-z, A-Z, 0-9, -, _ and space.\nThe maximum length is 63 characters.\n\nYou may also supply an empty string if you do not want to create a new subscription alias.\nIn this scenario, subscription_enabled should be set to false and subscription_id must be supplied.\n"
  type        = string
  default     = ""
}

variable "subscription_id" {
  description = ""
  type        = string
  default     = ""
}

variable "subscription_management_group_association_enabled" {
  description = "Whether to create the azurerm_management_group_subscription_association resource.\n\nIf enabled, the subscription_management_group_id must also be supplied.\n"
  type        = bool
  default     = false
}

variable "subscription_management_group_id" {
  description = "The destination management group ID for the new subscription.\n\n**Note:** Do not supply the display name.\nThe management group ID forms part of the Azure resource ID. E.g.,\n/providers/Microsoft.Management/managementGroups/{managementGroupId}.\n"
  type        = string
  default     = ""
}

variable "subscription_tags" {
  description = "A map of tags to assign to the newly created subscription.\nOnly valid when subsciption_alias_enabled is set to true.\n\nExample value:\n\nterraform\nsubscription_tags = {\n  mytag  = \"myvalue\"\n  mytag2 = \"myvalue2\"\n}\n\n"
  type        = map(string)
  default     = {}
}

variable "subscription_workload" {
  description = "The billing scope for the new subscription alias.\n\nThe workload type can be either Production or DevTest and is case sensitive.\n\nYou may also supply an empty string if you do not want to create a new subscription alias.\nIn this scenario, subscription_enabled should be set to false and subscription_id must be supplied.\n"
  type        = string
  default     = ""
}
