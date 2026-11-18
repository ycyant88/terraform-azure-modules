variable "enable_telemetry" {
  description = "This variable controls whether or not telemetry is enabled for the module.\nFor more information see <https://aka.ms/avm/telemetryinfo>.\nIf it is set to false, then no telemetry will be collected.\n"
  type        = bool
  default     = true
}

variable "firewall_policy_rule_collection_group_application_rule_collection" {
  description = "- action - (Required) The action to take for the application rules in this collection. Possible values are Allow and Deny.\n- name - (Required) The name which should be used for this application rule collection.\n- priority - (Required) The priority of the application rule collection. The range is 100\n\n---\nrule block supports the following:\n- description -\n- destination_addresses -\n- destination_fqdn_tags -\n- destination_fqdns -\n- destination_urls -\n- name - (Required) The name which should be used for this Firewall Policy Rule Collection Group. Changing this forces a new Firewall Policy Rule Collection Group to be created.\n- source_addresses -\n- source_ip_groups -\n- terminate_tls -\n- web_categories -\n\n---\nhttp_headers block supports the following:\n- name - (Required) Specifies the name of the header.\n- value - (Required) Specifies the value of the value.\n\n---\nprotocols block supports the following:\n- port - (Required) Port number of the protocol. Range is 0-64000.\n- type - (Required) Protocol type. Possible values are Http and Https.\n"
  type = list(object({
    action   = string
    name     = string
    priority = number
    rule = list(object({
      description           = optional(string)
      destination_addresses = optional(list(string), [])
      destination_fqdn_tags = optional(list(string), [])
      destination_fqdns     = optional(list(string), [])
      destination_urls      = optional(list(string), [])
      name                  = string
      source_addresses      = optional(list(string), [])
      source_ip_groups      = optional(list(string), [])
      terminate_tls         = optional(bool)
      web_categories        = optional(list(string), [])
      http_headers = optional(list(object({
        name  = string
        value = string
      })))
      protocols = optional(list(object({
        port = number
        type = string
      })))
    }))
  }))
  default = null
}

variable "firewall_policy_rule_collection_group_firewall_policy_id" {
  description = "(Required) The ID of the Firewall Policy where the Firewall Policy Rule Collection Group should exist. Changing this forces a new Firewall Policy Rule Collection Group to be created."
  type        = string
  default     = ""
}

variable "firewall_policy_rule_collection_group_name" {
  description = "(Required) The name which should be used for this Firewall Policy Rule Collection Group. Changing this forces a new Firewall Policy Rule Collection Group to be created."
  type        = string
  default     = ""
}

variable "firewall_policy_rule_collection_group_nat_rule_collection" {
  description = "- action - (Required) The action to take for the NAT rules in this collection. Currently, the only possible value is Dnat.\n- name - (Required) The name which should be used for this NAT rule collection.\n- priority - (Required) The priority of the NAT rule collection. The range is 100\n\n---\nrule block supports the following:\n- description -\n- destination_address -\n- destination_ports -\n- name - (Required) The name which should be used for this Firewall Policy Rule Collection Group. Changing this forces a new Firewall Policy Rule Collection Group to be created.\n- protocols -\n- source_addresses -\n- source_ip_groups -\n- translated_address -\n- translated_fqdn -\n- translated_port -\n"
  type = list(object({
    action   = string
    name     = string
    priority = number
    rule = list(object({
      description         = optional(string)
      destination_address = optional(string)
      destination_ports   = optional(list(string), [])
      name                = string
      protocols           = list(string)
      source_addresses    = optional(list(string), [])
      source_ip_groups    = optional(list(string), [])
      translated_address  = optional(string)
      translated_fqdn     = optional(string)
      translated_port     = number
    }))
  }))
  default = null
}

variable "firewall_policy_rule_collection_group_network_rule_collection" {
  description = "- action - (Required) The action to take for the network rules in this collection. Possible values are Allow and Deny.\n- name - (Required) The name which should be used for this network rule collection.\n- priority - (Required) The priority of the network rule collection. The range is 100\n\n---\nrule block supports the following:\n- description -\n- destination_addresses -\n- destination_fqdns -\n- destination_ip_groups -\n- destination_ports -\n- name - (Required) The name which should be used for this Firewall Policy Rule Collection Group. Changing this forces a new Firewall Policy Rule Collection Group to be created.\n- protocols -\n- source_addresses -\n- source_ip_groups -\n"
  type = list(object({
    action   = string
    name     = string
    priority = number
    rule = list(object({
      description           = optional(string)
      destination_addresses = optional(list(string), [])
      destination_fqdns     = optional(list(string), [])
      destination_ip_groups = optional(list(string), [])
      destination_ports     = list(string)
      name                  = string
      protocols             = list(string)
      source_addresses      = optional(list(string), [])
      source_ip_groups      = optional(list(string), [])
    }))
  }))
  default = null
}

variable "firewall_policy_rule_collection_group_priority" {
  description = "(Required) The priority of the Firewall Policy Rule Collection Group. The range is 100-65000."
  type        = number
  default     = ""
}

variable "firewall_policy_rule_collection_group_timeouts" {
  description = "- create - (Defaults to 30 minutes) Used when creating the Firewall Policy Rule Collection Group.\n- delete - (Defaults to 30 minutes) Used when deleting the Firewall Policy Rule Collection Group.\n- read - (Defaults to 5 minutes) Used when retrieving the Firewall Policy Rule Collection Group.\n- update - (Defaults to 30 minutes) Used when updating the Firewall Policy Rule Collection Group.\n"
  type = object({
    create = optional(string)
    delete = optional(string)
    read   = optional(string)
    update = optional(string)
  })
  default = null
}

variable "ignore_body_changes" {
  description = "Body paths that Terraform must stop managing on the underlying azapi_resource.\n\nThis is the AzAPI escape hatch for a member of the request body that something outside Terraform owns -- a rule collection maintained by a policy engine, for instance. Each value is a list of JMESPath-style body paths.\n\n- network_firewall_policies_rule_collection_groups - (Optional) Paths to ignore on the rule collection group, for example [\"properties.ruleCollections\"]. Defaults to [].\n\n> Note: ignore_body_changes is a write-only argument and requires Terraform 1.11 or later. At the [] default the argument is omitted entirely, so earlier versions are unaffected.\n"
  type = object({
    network_firewall_policies_rule_collection_groups = optional(list(string), [])
  })
  default = {}
}

variable "location" {
  description = "The Azure region for this module's telemetry deployment. Required when telemetry is enabled."
  type        = string
  default     = null
}

variable "resource_types" {
  description = "The ARM type and API version used for the underlying azapi_resource.\n\nThe default is not arbitrary and should not be changed without a reason. It is the LATEST API version embedded in Azure/azapi v2.13.0 for this type, which is the version azapi_resource's state mover writes into state when the moved block adopts an existing azurerm_firewall_policy_rule_collection_group. Matching it keeps the state migration consistent; the first migration plan can still include in-place updates as AzAPI adopts existing resources.\n\n- network_firewall_policies_rule_collection_groups - (Optional) Type of the rule collection group. Defaults to Microsoft.Network/firewallPolicies/ruleCollectionGroups@2025-07-01.\n"
  type = object({
    network_firewall_policies_rule_collection_groups = optional(string, "Microsoft.Network/firewallPolicies/ruleCollectionGroups@2025-07-01")
  })
  default = {}
}

variable "retry" {
  description = "The retry configuration applied to the underlying azapi_resource.\n\nUnlike the parent module this does NOT retry 409 Conflict. The parent retries it because a freshly created service principal makes role assignments fail that way; a rule collection group has no such well-understood transient failure, and ARM already serialises writes to the same firewall policy, so retrying blindly would only hide a real error.\n\n- error_message_regex - (Optional) A list of regular expressions matched against the error message. A match causes the request to be retried. Defaults to [\"ScopeLocked\", \"CannotDeleteResource\"], which covers TEARDOWN only: a management lock on the parent firewall policy is INHERITED by this rule collection group, and Terraform has no dependency edge between the parent's lock and this child, so a destroy can reach the group before the lock deletion has propagated. Set to null to disable retries entirely.\n- interval_seconds - (Optional) Base number of seconds to wait between retries. Defaults to the AzAPI provider default (10).\n- max_interval_seconds - (Optional) Maximum number of seconds to wait between retries. Defaults to the AzAPI provider default (180).\n\nSetting error_message_regex = null - or any value that leaves it null - disables retries. The module collapses the whole object to null in that case, because the AzAPI provider marks retry.error_message_regex required inside an otherwise optional block and a present object with a null list cannot be planned.\n"
  type = object({
    error_message_regex  = optional(list(string), ["ScopeLocked", "CannotDeleteResource"])
    interval_seconds     = optional(number, null)
    max_interval_seconds = optional(number, null)
  })
  default = {}
}

variable "timeouts" {
  description = "The timeouts applied to the underlying azapi_resource.\n\nEach value must be a string parsable as a Go duration, for example \"30s\", \"5m\" or \"1h30m\".\n\nA null value does NOT fall through to the AzAPI provider default. It falls through to the timeout azurerm_firewall_policy_rule_collection_group declared at hashicorp/azurerm v4.81.0 -- create 30m, read 5m, update 30m, delete 30m -- so an upgraded deployment keeps the behaviour it already had.\n\n- create - (Optional) Timeout for create operations.\n- delete - (Optional) Timeout for delete operations.\n- read - (Optional) Timeout for read operations.\n- update - (Optional) Timeout for update operations.\n\n> Note: var.firewall_policy_rule_collection_group_timeouts still works. var.timeouts takes precedence over it.\n"
  type = object({
    create = optional(string, null)
    delete = optional(string, null)
    read   = optional(string, null)
    update = optional(string, null)
  })
  default = {}
}
