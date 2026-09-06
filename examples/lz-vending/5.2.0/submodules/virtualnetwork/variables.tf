variable "enable_telemetry" {
  description = "This variable controls whether or not telemetry is enabled for the module.\nFor more information see <https://aka.ms/avm/telemetryinfo>.\nIf it is set to false, then no telemetry will be collected.\n"
  type        = bool
  default     = true
}

variable "location" {
  description = "The default location of resources created by this module.\nVirtual networks will be created in this location unless overridden by the location attribute.\n"
  type        = string
  default     = ""
}

variable "subscription_id" {
  description = "The subscription ID of the subscription to create the virtual network in.\n"
  type        = string
  default     = ""
}

variable "virtual_networks" {
  description = "A map of the virtual networks to create. The map key must be known at the plan stage, e.g. must not be calculated and known only after apply.\n\n### Required fields\n\n- name: The name of the virtual network. [required]\n- address_space: The address space of the virtual network as a list of strings in CIDR format, e.g. [\"192.168.0.0/24\", \"10.0.0.0/24\"]. [required]\n- resource_group_name: The name of the resource group to create the virtual network in. The default is that the resource group will be created by this module. [required]\n\n### DNS servers\n\n- dns_servers: A list of DNS servers to use for the virtual network, e.g. [\"192.168.0.1\", \"10.0.0.1]. If empty will use the Azure default DNS. [optional - default empty list]\nDNS. [optional - default empty list]\n\n### DDOS protection plan\n\n- ddos_protection_enabled: Whether to enable ddos protection. [optional]\n- ddos_protection_plan_id: The resource ID of the protection plan to attach the vnet. [optional - but required if ddos_protection_enabled is true]\n\n### Location\n\n- location: The location of the virtual network (and resource group if creation is enabled). [optional, will use var.location if not specified or empty string]\n\n> Note at least one of location or var.location must be specified.\n> If both are empty then the module will fail.\n\n#### Subnets\n\n- subnets - (Optional) A map of subnets to create in the virtual network. The value is an object with the following fields:\n  - name - The name of the subnet.\n  - address_prefixes - The IPv4 address prefixes to use for the subnet in CIDR format.\n  - nat_gateway - (Optional) An object with the following fields:\n    - id - The ID of the NAT Gateway which should be associated with the Subnet. Changing this forces a new resource to be created.\n  - network_security_group - (Optional) An object with the following fields:\n    - id - The ID of the Network Security Group which should be associated with the Subnet. Changing this forces a new association to be created.\n  - private_endpoint_network_policies_enabled - (Optional) Enable or Disable network policies for the private endpoint on the subnet. Setting this to true will Enable the policy and setting this to false will Disable the policy. Defaults to true.\n  - private_link_service_network_policies_enabled - (Optional) Enable or Disable network policies for the private link service on the subnet. Setting this to true will Enable the policy and setting this to false will Disable the policy. Defaults to true.\n  - route_table - (Optional) An object with the following fields which are mutually exclusive, choose either an external route table or the generated route table:\n    - id - The ID of the Route Table which should be associated with the Subnet. Changing this forces a new association to be created.\n  - default_outbound_access_enabled - (Optional) Whether to allow internet access from the subnet. Defaults to false.\n  - service_endpoints - (Optional) The list of Service endpoints to associate with the subnet.\n  - service_endpoint_policies - (Optional) The list of Service Endpoint Policy objects with the resource id to associate with the subnet.\n    - id - The ID of the endpoint policy that should be associated with the subnet.\n  - service_endpoint_policy_assignment_enabled - (Optional) Should the Service Endpoint Policy be assigned to the subnet? Default true.\n  - delegation - (Optional) An object with the following fields:\n    - name - The name of the delegation.\n    - service_delegation - An object with the following fields:\n      - name - The name of the service delegation.\n\n### Hub network peering values\n\nThe following values configure bi-directional hub & spoke peering for the given virtual network.\n\n- hub_peering_enabled: Whether to enable hub peering. [optional - default false]\n- hub_network_resource_id: The resource ID of the hub network to peer with. [optional - but required if hub_peering_enabled is true]\n- hub_peering_name_tohub: The name of the peering to the hub network. [optional - leave empty to use calculated name]\n- hub_peering_name_fromhub: The name of the peering from the hub network. [optional - leave empty to use calculated name]\n- hub_peering_use_remote_gateways: Whether to use remote gateways for the hub peering. [optional - default true]\n\n#### Hub network peering options\n\nThe following values configure the options for the hub network peering. These are configurable in each direction:\n\n- allow_forwarded_traffic: Whether to allow forwarded traffic for the peering. [optional - default true]\n- allow_gateway_transit: Whether to allow gateway transit for the peering. [optional - default false (outbound) or true (inbound)]\n- allow_virtual_network_access: Whether to allow virtual network access for the peering. [optional - default true]\n- do_not_verify_remote_gateways: Whether to not verify remote gateways for the peering. [optional - default false]\n- enable_only_ipv6_peering: Whether to enable only IPv6 peering. [optional - default false]\n- local_peered_address_spaces: A list of local address spaces to peer with. [optional - default empty and only used if peer_complete_vnets is false]\n- local_peered_subnets: A list of local subnets to peer with. [optional - default empty and only used if peer_complete_vnets is false]\n- peer_complete_vnets: Whether to peer complete virtual networks. [optional - default true]\n- remote_peered_address_spaces: A list of remote address spaces to peer with. [optional - default empty and only used if peer_complete_vnets is false]\n- remote_peered_subnets: A list of remote subnets to peer with. [optional - default empty and only used if peer_complete_vnets is false]\n- use_remote_gateways: Whether to use remote gateways for the peering. [optional - default true (outbound) or false (inbound)]\n\n### Mesh peering values\n\nMesh peering is the capability to create a bi-directional peerings between all supplied virtual networks in var.virtual_networks.\nPeerings will only be created between virtual networks with the mesh_peering_enabled value set to true.\n\n- mesh_peering_enabled: Whether to enable mesh peering for this virtual network. Must be enabled on more than one virtual network for any peerings to be created. [optional]\n- mesh_peering_allow_forwarded_traffic: Whether to allow forwarded traffic for the mesh peering. [optional - default false]\n\n### Resource group values [DEPRECATED]\n\n**Note:** The creation of resource groups should be done using the resource module, in v6.0.0 these variables will be retired from the virtual network objects.\n\nThe default is that a resource group will be created for each resource_group_name specified in the var.virtual_networks map.\nIt is possible to use a pre-existing resource group by setting resource_group_creation_enabled to false.\nWe recommend using resource groups aligned to the region of the virtual network,\nhowever if you want multiple virtual networks in more than one location to share a resource group,\nonly one of the virtual networks should have resource_group_creation_enabled set to true.\n\n- resource_group_creation_enabled: Whether to create a resource group for the virtual network. [optional - default true]\n- resource_group_lock_enabled: Whether to create a CanNotDelete resource lock on the resource group. [optional - default true]\n- resource_group_lock_name: The name of the resource lock. [optional - leave empty to use calculated name]\n- resource_group_tags: A map of tags to apply to the resource group, e.g. { mytag = \"myvalue\", mytag2 = \"myvalue2\" }. [optional - default empty]\n\n### Virtual WAN values\n\n- vwan_associated_routetable_resource_id: The resource ID of the route table to associate with the virtual network. [optional - leave empty to use defaultRouteTable on hub]\n- vwan_connection_enabled: Whether to create a connection to a Virtual WAN. [optional - default false]\n- vwan_connection_name: The name of the connection to the Virtual WAN. [optional - leave empty to use calculated name]\n- vwan_hub_resource_id: The resource ID of the hub to connect to. [optional - but required if vwan_connection_enabled is true]\n- vwan_propagated_routetables_labels: A list of labels of route tables to propagate to the virtual network. [optional - leave empty to use [\"default\"]]\n- vwan_propagated_routetables_resource_ids: A list of resource IDs of route tables to propagate to the virtual network. [optional - leave empty to use defaultRouteTable on hub]\n- vwan_security_configuration: A map of security configuration values for VWAN hub connection - see below. [optional - default empty]\n  - secure_internet_traffic: Whether to forward internet-bound traffic to the destination specified in the routing policy. [optional - default false]\n  - secure_private_traffic: Whether to all internal traffic to the destination specified in the routing policy. Not compatible with routing_intent_enabled. [optional - default false]\n  - routing_intent_enabled: Enable to use with a Virtual WAN hub with routing intent enabled. Routing intent on hub is configured outside this module. [optional - default false]\n\n### Tags\n\n- tags: A map of tags to apply to the virtual network. [optional - default empty]\n"
  type = map(object({
    name                = string
    address_space       = list(string)
    resource_group_name = string

    location = optional(string)

    dns_servers             = optional(list(string), [])
    flow_timeout_in_minutes = optional(number)

    ddos_protection_enabled = optional(bool, false)
    ddos_protection_plan_id = optional(string)

    subnets = optional(map(object(
      {
        name             = string
        address_prefixes = list(string)
        nat_gateway = optional(object({
          id = string
        }))
        network_security_group = optional(object({
          id = string
        }))
        private_endpoint_network_policies             = optional(string, "Enabled")
        private_link_service_network_policies_enabled = optional(bool, true)
        route_table = optional(object({
          id = optional(string)
        }))
        default_outbound_access_enabled = optional(bool, false)
        service_endpoints               = optional(set(string))
        service_endpoint_policies = optional(map(object({
          id = string
        })))
        delegation = optional(list(
          object(
            {
              name = string
              service_delegation = object({
                name = string
              })
            }
          )
        ))
      }
    )), {})

    hub_network_resource_id = optional(string)
    hub_peering_enabled     = optional(bool, false)
    hub_peering_direction   = optional(string, "both")
    hub_peering_name_tohub  = optional(string)
    hub_peering_options_tohub = optional(object({
      allow_forwarded_traffic       = optional(bool, true)
      allow_gateway_transit         = optional(bool, false)
      allow_virtual_network_access  = optional(bool, true)
      do_not_verify_remote_gateways = optional(bool, false)
      enable_only_ipv6_peering      = optional(bool, false)
      local_peered_address_spaces   = optional(list(string), [])
      local_peered_subnets          = optional(list(string), [])
      peer_complete_vnets           = optional(bool, true)
      remote_peered_address_spaces  = optional(list(string), [])
      remote_peered_subnets         = optional(list(string), [])
      use_remote_gateways           = optional(bool, true)
    }), {})
    hub_peering_name_fromhub = optional(string)
    hub_peering_options_fromhub = optional(object({
      allow_forwarded_traffic       = optional(bool, true)
      allow_gateway_transit         = optional(bool, true)
      allow_virtual_network_access  = optional(bool, true)
      do_not_verify_remote_gateways = optional(bool, false)
      enable_only_ipv6_peering      = optional(bool, false)
      local_peered_address_spaces   = optional(list(string), [])
      local_peered_subnets          = optional(list(string), [])
      peer_complete_vnets           = optional(bool, true)
      remote_peered_address_spaces  = optional(list(string), [])
      remote_peered_subnets         = optional(list(string), [])
      use_remote_gateways           = optional(bool, false)
    }), {})

    mesh_peering_enabled                 = optional(bool, false)
    mesh_peering_allow_forwarded_traffic = optional(bool, false)

    resource_group_creation_enabled = optional(bool, true)
    resource_group_lock_enabled     = optional(bool, true)
    resource_group_lock_name        = optional(string)
    resource_group_tags             = optional(map(string), {})

    vwan_associated_routetable_resource_id   = optional(string)
    vwan_connection_enabled                  = optional(bool, false)
    vwan_connection_name                     = optional(string)
    vwan_hub_resource_id                     = optional(string)
    vwan_propagated_routetables_labels       = optional(list(string), [])
    vwan_propagated_routetables_resource_ids = optional(list(string), [])
    vwan_security_configuration = optional(object({
      secure_internet_traffic = optional(bool, false)
      secure_private_traffic  = optional(bool, false)
      routing_intent_enabled  = optional(bool, false)
    }), {})

    tags = optional(map(string), {})
  }))
  default = ""
}
