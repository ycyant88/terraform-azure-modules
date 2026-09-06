variable "firewall_policy_rule_collection_group_application_rule_collection" {
  description = "- action - (Required) The action to take for the application rules in this collection. Possible values are Allow and Deny.\n- name - (Required) The name which should be used for this application rule collection.\n- priority - (Required) The priority of the application rule collection. The range is 100\n\n---\nrule block supports the following:\n- description - \n- destination_addresses - \n- destination_fqdn_tags - \n- destination_fqdns - \n- destination_urls - \n- name - (Required) The name which should be used for this Firewall Policy Rule Collection Group. Changing this forces a new Firewall Policy Rule Collection Group to be created.\n- source_addresses - \n- source_ip_groups - \n- terminate_tls - \n- web_categories - \n\n---\nhttp_headers block supports the following:\n- name - (Required) Specifies the name of the header.\n- value - (Required) Specifies the value of the value.\n\n---\nprotocols block supports the following:\n- port - (Required) Port number of the protocol. Range is 0-64000.\n- type - (Required) Protocol type. Possible values are Http and Https.\n"
  type = list(object({
    action   = string
    name     = string
    priority = number
    rule = list(object({
      description           = optional(string)
      destination_addresses = optional(list(string))
      destination_fqdn_tags = optional(list(string))
      destination_fqdns     = optional(list(string))
      destination_urls      = optional(list(string))
      name                  = string
      source_addresses      = optional(list(string))
      source_ip_groups      = optional(list(string))
      terminate_tls         = optional(bool)
      web_categories        = optional(list(string))
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
  description = "- action - (Required) The action to take for the NAT rules in this collection. Currently, the only possible value is Dnat.\n- name - (Required) The name which should be used for this NAT rule collection.\n- priority - (Required) The priority of the NAT rule collection. The range is 100\n\n---\nrule block supports the following:\n- description - \n- destination_address - \n- destination_ports - \n- name - (Required) The name which should be used for this Firewall Policy Rule Collection Group. Changing this forces a new Firewall Policy Rule Collection Group to be created.\n- protocols - \n- source_addresses - \n- source_ip_groups - \n- translated_address - \n- translated_fqdn - \n- translated_port - \n"
  type = list(object({
    action   = string
    name     = string
    priority = number
    rule = list(object({
      description         = optional(string)
      destination_address = optional(string)
      destination_ports   = optional(list(string))
      name                = string
      protocols           = list(string)
      source_addresses    = optional(list(string))
      source_ip_groups    = optional(list(string))
      translated_address  = optional(string)
      translated_fqdn     = optional(string)
      translated_port     = number
    }))
  }))
  default = null
}

variable "firewall_policy_rule_collection_group_network_rule_collection" {
  description = "- action - (Required) The action to take for the network rules in this collection. Possible values are Allow and Deny.\n- name - (Required) The name which should be used for this network rule collection.\n- priority - (Required) The priority of the network rule collection. The range is 100\n\n---\nrule block supports the following:\n- description - \n- destination_addresses - \n- destination_fqdns - \n- destination_ip_groups - \n- destination_ports - \n- name - (Required) The name which should be used for this Firewall Policy Rule Collection Group. Changing this forces a new Firewall Policy Rule Collection Group to be created.\n- protocols - \n- source_addresses - \n- source_ip_groups - \n"
  type = list(object({
    action   = string
    name     = string
    priority = number
    rule = list(object({
      description           = optional(string)
      destination_addresses = optional(list(string))
      destination_fqdns     = optional(list(string))
      destination_ip_groups = optional(list(string))
      destination_ports     = list(string)
      name                  = string
      protocols             = list(string)
      source_addresses      = optional(list(string))
      source_ip_groups      = optional(list(string))
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
