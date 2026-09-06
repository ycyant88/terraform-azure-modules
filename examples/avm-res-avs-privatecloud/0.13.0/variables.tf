variable "addons" {
  description = "Map object containing configurations for the different addon types.  Each addon type has associated fields and specific naming requirements.  A full input example is provided below.\n\n- Arc- Use this exact key value for deploying the ARC extension\n  - arc_vcenter (Optional) - The VMware vcenter resource id as a string\n- HCX - Use this exact key value for deploying the HCX extension\n  - hcx_key_names (Optional) - A list of key names to create HCX key names.\n  - hcx_license_type (Optional) - The type of license to configure for HCX.  Valid values are \"Advanced\" and \"Enterprise\".\n  - hcx_management_network (Optional) - The management network to use for HCX.  This should be non-overlapping, routable /24 or larger CIDR block.\n  - hcx_uplink_network (Optional) - The uplink network to use for HCX.  This should be non-overlapping, routable /24 or larger CIDR block.\n- SRM - Use this exact key value for deploying the SRM extension\n  - srm_license_key (Optional) - the license key to use when enabling the SRM addon\n- VR - Use this exact key value for deploying the VR extension\n  - vr_vrs_count (Optional) - The Vsphere replication server count\n\nExample Input:\nhcl\n{\n  Arc = {\n    arc_vcenter = \"<vcenter resource id>\"\n  }\n  HCX = {\n    hcx_key_names = [\"key1\", \"key2\"]\n    hcx_license_type = \"Enterprise\"\n  }\n  SRM = {\n    srm_license_key = \"<srm license key value>\"\n  }\n  VR = {\n    vr_vrs_count = 2\n  }\n}\n\n"
  type = map(object({
    arc_vcenter            = optional(string)
    hcx_key_names          = optional(list(string), [])
    hcx_license_type       = optional(string, "Enterprise")
    hcx_management_network = optional(string, null)
    hcx_uplink_network     = optional(string, null)
    srm_license_key        = optional(string)
    vr_vrs_count           = optional(number, 0)
  }))
  default = {}
}

variable "avs_interconnect_connections" {
  description = "Map of string objects describing one or more private cloud interconnect connections for private clouds in the same region.  The map key will be used for the connection name.\n\n- <map key> - use a custom map key to use as the name for the interconnect connection\n  - linked_private_cloud_resource_id = (Required) - The resource ID of the private cloud on the other side of the interconnect. Must be in the same region.\n\nExample Input:\nhcl\n{\n  interconnect_sddc_1 = {\n    linked_private_cloud_resource_id = \"<SDDC resource ID>\"\n  }\n}\n\n"
  type = map(object({
    linked_private_cloud_resource_id = string
  }))
  default = {}
}

variable "avs_network_cidr" {
  description = "The full /22 or larger network CIDR summary for the private cloud managed components. This range should not intersect with any IP allocations that will be connected or visible to the private cloud."
  type        = string
  default     = ""
}

variable "clusters" {
  description = "This object describes additional clusters in the private cloud in addition to the management cluster. The map key will be used as the cluster name\n\n- <map key> - Provide a custom key name that will be used as the cluster name\n  - cluster_node_count = (required) - Integer number of nodes to include in this cluster between 3 and 16\n  - sku_name           = (required) - String for the sku type to use for the cluster nodes. Changing this forces a new cluster to be created\n\nExample Input:\nhcl\ncluster1 = {\n  cluster_node_count = 3\n  sku_name           = \"av36p\"\n}\n\n"
  type = map(object({
    cluster_node_count = number
    sku_name           = string
  }))
  default = {}
}

variable "customer_managed_key" {
  description = "This object defines the customer managed key details to use when encrypting the VSAN datastore.\n\n- <map key> - Provide a custom key value that will be used as the dhcp configuration name\n  - key_vault_resource_id = (Required) - The full Azure resource ID of the key vault where the encryption key will be sourced from\n  - key_name              = (Required) - The name for the encryption key\n  - key_version           = (Optional) - The key version value for the encryption key.\n  - user_assigned_identity = (Non-Functional) - AVS doesn't currently\n\nExample Inputs:\nhcl\n{\n  key_vault_resource_id = azurerm_key_vault.example.id\n  key_name              = azurerm_key_vault_key.example.name\n  key_version           = azurerm_key_vault_key.example.version\n}\n\n"
  type = object({
    key_vault_resource_id = string
    key_name              = string
    key_version           = optional(string, null)
    user_assigned_identity = optional(object({
      resource_id = string
    }), null)
  })
  default = null
}

variable "default_dns_ips" {
  description = "A list of up to DNS IP addresses to use for the private cloud's default DNS service. If provided, these will replace the default Cloudflare DNS IPs."
  type        = list(string)
  default     = []
}

variable "dhcp_configuration" {
  description = "This map object describes the DHCP configuration to use for the private cloud. It can remain unconfigured or define a RELAY or SERVER based configuration. Defaults to unconfigured. This allows for new segments to define DHCP ranges as part of their definition. Only one DHCP configuration is allowed.\n\n- <map key> - Provide a custom key value that will be used as the dhcp configuration name\n  - display_name           = (Required) - The display name for the dhcp configuration being created\n  - dhcp_type              = (Required) - The type for the DHCP server configuration.  Valid types are RELAY or SERVER. RELAY defines a relay configuration pointing to your existing DHCP servers. SERVER configures NSX-T to act as the DHCP server.\n  - relay_server_addresses = (Optional) - A list of existing DHCP server ip addresses from 1 to 3 servers.  Required when type is set to RELAY.\n  - server_lease_time      = (Optional) - The lease time in seconds for the DHCP server. Defaults to 84600 seconds.(24 hours) Only valid for SERVER configurations\n  - server_address         = (Optional) - The CIDR range that NSX-T will use for the DHCP Server.\n\nExample Input:\nhcl\n#RELAY example\nrelay_config = {\n  display_name           = \"relay_example\"\n  dhcp_type              = \"RELAY\"\n  relay_server_addresses = [\"10.0.1.50\", \"10.0.2.50\"]\n}\n\n#SERVER example\nserver_config = {\n  display_name      = \"server_example\"\n  dhcp_type         = \"SERVER\"\n  server_lease_time = 14400\n  server_address    = \"10.1.0.1/24\"\n}\n\n"
  type = map(object({
    display_name           = string
    dhcp_type              = string
    relay_server_addresses = optional(list(string), [])
    server_lease_time      = optional(number, 86400)
    server_address         = optional(string, null)
  }))
  default = {}
}

variable "diagnostic_settings" {
  description = "This map object is used to define the diagnostic settings on the virtual machine.  This functionality does not implement the diagnostic settings extension, but instead can be used to configure sending the vm metrics to one of the standard targets.\n\n- <map key> - Provide a map key that will be used for the name of the diagnostic settings configuration\n  - name                                     = (required) - Name to use for the Diagnostic setting configuration.  Changing this creates a new resource\n  - log_categories_and_groups                = (Optional) - List of strings used to define log categories and groups. Currently not valid for the VM resource\n  - log_groups                               = (Optional) - A set of log groups to send to the log analytics workspace. Defaults to [\"allLogs\"]\n  - metric_categories                        = (Optional) - List of strings used to define metric categories. Currently only AllMetrics is valid\n  - log_analytics_destination_type           = (Optional) - Valid values are null, AzureDiagnostics, and Dedicated.  Defaults to Dedicated\n  - workspace_resource_id                    = (Optional) - The Log Analytics Workspace Azure Resource ID when sending logs or metrics to a Log Analytics Workspace\n  - storage_account_resource_id              = (Optional) - The Storage Account Azure Resource ID when sending logs or metrics to a Storage Account\n  - event_hub_authorization_rule_resource_id = (Optional) - The Event Hub Namespace Authorization Rule Resource ID when sending logs or metrics to an Event Hub Namespace\n  - event_hub_name                           = (Optional) - The Event Hub name when sending logs or metrics to an Event Hub\n  - marketplace_partner_resource_id          = (Optional) - The marketplace partner solution Azure Resource ID when sending logs or metrics to a partner integration\n\nExample Input:\nhcl\ndiagnostic_settings = {\n  nic_diags = {\n    name                  = module.naming.monitor_diagnostic_setting.name_unique\n    workspace_resource_id = azurerm_log_analytics_workspace.this_workspace.id\n    metric_categories     = [\"AllMetrics\"]\n  }\n}\n\n"
  type = map(object({
    name                                     = optional(string, null)
    log_categories                           = optional(set(string), [])
    log_groups                               = optional(set(string), ["allLogs"])
    metric_categories                        = optional(set(string), ["AllMetrics"])
    log_analytics_destination_type           = optional(string, "Dedicated")
    workspace_resource_id                    = optional(string, null)
    storage_account_resource_id              = optional(string, null)
    event_hub_authorization_rule_resource_id = optional(string, null)
    event_hub_name                           = optional(string, null)
    marketplace_partner_resource_id          = optional(string, null)
  }))
  default = {}
}

variable "dns_forwarder_zones" {
  description = "Map of string objects describing one or more dns forwarder zones for NSX within the private cloud. Up to 5 additional forwarder zone can be configured. This is primarily useful for identity source configurations or in cases where NSX DHCP is providing DNS configurations.\n\n- <map key> - Provide a key value that will be used as the name for the dns forwarder zone\n  - display_name               = (Required) - The display name for the new forwarder zone being created.  Commonly this aligns with the domain name.\n  - dns_server_ips             = (Required) - A list of up to 3 IP addresses where zone traffic will be forwarded.\n  - domain_names               = (Required) - A list of domain names that will be forwarded as part of this zone.\n  - source_ip                  = (Optional) - Source IP of the DNS zone.  Defaults to an empty string.\n  - add_to_default_dns_service = (Optional) - Set to try to associate this zone with the default DNS service.  Up to 5 zones can be linked.\n\nExample Input:\nhcl\n{\n  test_local = {\n    display_name               = local.test_domain_name\n    dns_server_ips             = [\"10.0.1.53\",\"10.0.2.53\"]\n    domain_names               = [\"test.local\"]\n    add_to_default_dns_service = true\n  }\n}\n\n"
  type = map(object({
    display_name               = string
    dns_server_ips             = list(string)
    domain_names               = list(string)
    source_ip                  = optional(string, "")
    add_to_default_dns_service = optional(bool, false)
  }))
  default = {}
}

variable "dns_zone_type" {
  description = "The type of DNS zone to create. Valid values are Private and Public. This value is only valid for generation 2 private clouds. Defaults to Public. When set to Private an Azure DNS resolver or Virtual Machine based DNS server in the Vnet is required to resolve names of the ESX and NSX-T components. See this document for details.https://learn.microsoft.com/en-us/azure/azure-vmware/native-dns-forward-lookup-zone"
  type        = string
  default     = "Public"
}

variable "elastic_san_datastores" {
  description = "Map of objects describing one or more elastic sAN based datastore to configure on this private cloud.\n\n- <map key> - Unique map key that will be used as the prefix for the datastore attachment name.\n  - cluster_names = (Required) - Set of cluster names that should use the volume as a datastore\n  - esan_volume_resource_id- The Azure Resource id for the elastic san volume used to host the datastore.\n  - datastore_name = (Optional) - The name of the datastore. This can be used to override the datastore naming when attaching the same volume to multiple clusters. If left as null the datastore name will be generated using the map key value.\n\nExample Input:\nhcl\nelastic_san_datastores = {\n  esan_datastore_cluster1 = {\n    esan_volume_resource_id = module.elastic_san.volumes[\"vg_1-volume_1\"].id\n    cluster_names           = [\"Cluster-1\"]\n  }\n}\n\n"
  type = map(object({
    cluster_names           = set(string)
    esan_volume_resource_id = string
    datastore_name          = optional(string, null)
  }))
  default = {}
}

variable "enable_stretch_cluster" {
  description = "Set this value to true if deploying an AVS stretch cluster."
  type        = bool
  default     = false
}

variable "enable_telemetry" {
  description = "This variable controls whether or not telemetry is enabled for the module.\nFor more information see <https://aka.ms/avm/telemetryinfo>.\nIf it is set to false, then no telemetry will be collected.\n"
  type        = bool
  default     = true
}

variable "expressroute_connections" {
  description = "Map of string objects describing one or more ExpressRoute connections to be configured by the private cloud. The map key will be used for the connection name.\n\n- <map key> - Provide an arbitrary key value that will be used to identify this expressRoute connection\n  - name                                 = (Required) - The name to use for the expressRoute connection.\n  - expressroute_gateway_resource_id     = (Required) - The Azure Resource ID for the ExpressRoute gateway where the connection will be made.\n  - vwan_hub_connection                  = (Optional) - Set this to true if making a connection to a VWAN hub.  Leave as false if connecting to an ExpressRoute gateway in a virtual network hub.\n  - authorization_key_name               = (Optional) - The authorization key name that should be used from the auth key map. If no key is provided a name will be generated from the map key.\n  - fast_path_enabled                    = (Optional) - Should fast path gateway bypass be enabled. There are sku and cost considerations to be aware of when enabling fast path. Defaults to false\n  - routing_weight                       = (Optional) - The routing weight value to use for this connection.  Defaults to 0.\n  - enable_internet_security             = (Optional) - Set this to true if connecting to a secure VWAN hub and you want the hub NVA to publish a default route to AVS.\n  - tags                                 = (Optional) - Map of strings describing any custom tags to apply to this connection resource\n  - network_resource_group_resource_id   = (Optional) - The resource ID of an external resource group, **must be the same resource group as the virtual network gateway you are connecting to**. This is used to place the virtual network gateway connection resource with the virtual network gateway if the gateway is in a separate location.\n  - network_resource_group_location      = (Optional) - The location of an external resource group. This is used to place the virtual network gateway connection resource with the virtual network gateway if the gateway is in a separate location.\n  - routing                              = (Optional) - Map of objects used to describe any VWAN and Virtual Hub custom routing for this connection\n    - associated_route_table_resource_id = (Optional) - The Azure Resource ID of the Virtual Hub Route Table associated with this Express Route Connection.\n    - inbound_route_map_resource_id      = (Optional) - The Azure Resource ID Of the Route Map associated with this Express Route Connection for inbound learned routes\n    - outbound_route_map_resource_id     = (Optional) - The Azure Resource ID Of the Route Map associated with this Express Route Connection for outbound advertised routes\n    - propagated_route_table = object({\n      - labels = (Optional) - The list of labels for route tables where the routes will be propagated to\n      - ids    = (Optional) - The list of Azure Resource IDs for route tables where the routes will be propagated to\n\nExample Input:\nhcl\n{\n  exr_region_1 = {\n    expressroute_gateway_resource_id      = \"<expressRoute Gateway Resource ID>\"\n    peer_expressroute_circuit_resource_id = \"Azure Resource ID for the peer expressRoute circuit\"'\n  }\n}\n\n"
  type = map(object({
    name                               = string
    expressroute_gateway_resource_id   = string
    deployment_order                   = optional(number, 1)
    vwan_hub_connection                = optional(bool, false)
    authorization_key_name             = optional(string, null)
    fast_path_enabled                  = optional(bool, false)
    private_link_fast_path_enabled     = optional(bool, false)
    routing_weight                     = optional(number, 0)
    enable_internet_security           = optional(bool, false)
    tags                               = optional(map(string), {})
    network_resource_group_resource_id = optional(string, null)
    network_resource_group_location    = optional(string, null)
    routing = optional(map(object({
      associated_route_table_resource_id = optional(string, null)
      inbound_route_map_resource_id      = optional(string, null)
      outbound_route_map_resource_id     = optional(string, null)
      propagated_route_table = optional(object({
        labels = optional(list(string), [])
        ids    = optional(list(string), [])
      }), {})
    })), {})
  }))
  default = {}
}

variable "extended_network_blocks" {
  description = "If using AV64 sku's in non-management Gen 1 clusters it is required to provide one /23 CIDR block or three /23 CIDR blocks. Provide a list of CIDR strings if planning to use AV64 nodes."
  type        = list(string)
  default     = []
}

variable "external_storage_address_block" {
  description = "If using Elastic SAN or other ISCSI storage, provide an /24 CIDR range as a string for use in connecting the external storage.  Example: 10.10.0.0/24"
  type        = string
  default     = null
}

variable "gen2_private_cloud" {
  description = "Map input used for generation 2 private cloud configuration. This map allows the module to make gen2 decisions at plan time even when the virtual network resource ID is unknown until apply.\n\n- <map key> - Provide a single custom key for the gen2 configuration object.\n  - virtual_network_resource_id = (Required) - The Azure Resource ID for the virtual network where the private cloud will be deployed.\n\nExample Input:\nhcl\ngen2_private_cloud = {\n  primary = {\n    virtual_network_resource_id = module.vnet.id\n  }\n}\n\n"
  type = map(object({
    virtual_network_resource_id = string
  }))
  default = {}
}

variable "gen2_subnets_user_defined_routes" {
  description = "Map of string objects describing the user-defined routes for each subnet. The map key will be used as the subnet name.\n\n- <map key> - Provide a key value that is unique for the UDR config\n\n  - is_mgmnt - (Required) - A boolean value indicating whether the subnet is the AVS management subnet. This modifies the service created UDR. Only one management configuration should be used. If false, the configuration will create/update the two -gw* subnet UDRs.\n  - bgp_route_propagation_enabled - (Optional) - A boolean value indicating whether BGP route propagation is enabled for the UDR. Defaults to true.\n  - name - (Optional) - The name to use for the route table. If is_mgmt is true, this value will be ignored.\n  - routes - (Required) - A map of route objects for the subnet UDR\n    - <route key> - Provide a key value that will be used as the route name\n      - address_prefix - (Required) - The address prefix for the route\n      - next_hop_type - (Required) - The type of the next hop for the route\n      - next_hop_in_ip_address - (Optional) - The IP address of the next hop for the route\n\nExample Input:\nhcl\ngen2_subnets_user_defined_routes = {\n  gw_subnets = {\n    is_mgmt = false\n    bgp_route_propagation_enabled = false\n    routes = {\n      route1 = {\n        address_prefix = \"0.0.0.0/0\"\n        next_hop_type = \"VirtualAppliance\"\n        next_hop_in_ip_address = \"10.0.0.4\"\n      }\n    }\n  }\n}\n\n"
  type = map(object({
    is_mgmt                       = bool
    bgp_route_propagation_enabled = optional(bool, true)
    name                          = optional(string)
    routes = map(object({
      address_prefix         = string
      next_hop_type          = string
      next_hop_in_ip_address = optional(string)
    }))
  }))
  default = {}
}

variable "global_reach_connections" {
  description = "Map of string objects describing one or more global reach connections to be configured by the private cloud. The map key will be used for the connection name.\n\n- <map key> - Provide a key value that will be used as the global reach connection name\n  - authorization_key                     = (Required) - The authorization key from the peer expressroute\n  - peer_expressroute_circuit_resource_id = (Optional) - Identifier of the ExpressRoute Circuit to peer within the global reach connection\n\nExample Input:\nhcl\n  {\n    gr_region_1 = {\n      authorization_key                     = \"<auth key value>\"\n      peer_expressroute_circuit_resource_id = \"Azure Resource ID for the peer expressRoute circuit\"'\n    }\n  }\n\n"
  type = map(object({
    authorization_key                     = string
    peer_expressroute_circuit_resource_id = string
  }))
  default = {}
}

variable "internet_enabled" {
  description = "Configure the internet SNAT option to be on or off. Defaults to off."
  type        = bool
  default     = false
}

variable "internet_inbound_public_ips" {
  description = "This map object that describes the public IP configuration. Configure this value in the event you need direct inbound access to the private cloud from the internet. The code uses the map key as the display name for each configuration.\n\n- <map key> - Provide a key value that will be used as the public ip configuration name\n  - number_of_ip_addresses = (required) - The number of IP addresses to assign to this private cloud.\n\nExample Input:\nhcl\ninternet_inbound_public_ips = {\n  public_ip_config = { #this key will be used as the display name\n    number_of_ip_addresses = 1\n  }\n}\n\n"
  type = map(object({
    number_of_ip_addresses = number
  }))
  default = {}
}

variable "location" {
  description = "The Azure region where this and supporting resources should be deployed."
  type        = string
  default     = ""
}

variable "lock" {
  description = "Controls the Resource Lock configuration for this resource. The following properties can be specified:\n\n- kind - (Required) The type of lock. Possible values are \\\"CanNotDelete\\\" and \\\"ReadOnly\\\".\n- name - (Optional) The name of the lock. If not specified, a name will be generated based on the kind value. Changing this forces the creation of a new resource.\n"
  type = object({
    kind = string
    name = optional(string, null)
  })
  default = null
}

variable "managed_identities" {
  description = "  Controls the Managed Identity configuration on this resource. The following properties can be specified:\n\n  - system_assigned - (Optional) Specifies if the System Assigned Managed Identity should be enabled. This is used to configure encryption using customer managed keys.\n  - user_assigned_resource_ids - (Optional) Specifies a list of User Assigned Managed Identity resource IDs to be assigned to this resource. Currently unused by this resource.\n"
  type = object({
    system_assigned            = optional(bool, false)
    user_assigned_resource_ids = optional(set(string), [])
  })
  default = {}
}

variable "management_cluster_size" {
  description = "The number of nodes to include in the management cluster. The minimum value is 3 and the current maximum is 16."
  type        = number
  default     = 3
}

variable "name" {
  description = "The name to use when creating the avs sddc private cloud."
  type        = string
  default     = ""
}

variable "netapp_files_datastores" {
  description = "This map of objects describes one or more netapp volume attachments.  The map key will be used for the datastore name and should be unique.\n\n- <map key> - Provide a key value that will be used as the netapp files datastore name\n  - netapp_volume_resource_id = (required) - The azure resource ID for the Azure Netapp Files volume being attached to the cluster nodes.\n  - cluster_names             = (required) - A set of cluster name(s) where this volume should be attached\n\nExample Input:\nhcl\nnetapp_files_datastores = {\n  anf_datastore_cluster1 = {\n    netapp_volume_resource_id = module.create_anf_volume.volume_id\n    cluster_names             = [\"Cluster-1\"]\n  }\n}\n\n"
  type = map(object({
    netapp_volume_resource_id = string
    cluster_names             = set(string)
  }))
  default = {}
}

variable "nsxt_password" {
  description = "The password value to use for the cloudadmin account password in the local domain in nsxt. If this is left as null a random password will be generated for the deployment"
  type        = string
  default     = null
}

variable "primary_zone" {
  description = "This value represents the zone for deployment in a standard deployment or the primary zone in a stretch cluster deployment. Defaults to null to let Azure select the zone"
  type        = number
  default     = null
}

variable "resource_group_name" {
  description = "The resource group where the resources will be deployed."
  type        = string
  default     = ""
}

variable "resource_group_resource_id" {
  description = "The resource group Azure Resource ID for the deployment resource group. Used for the AzAPI resource that deploys the private cloud."
  type        = string
  default     = ""
}

variable "role_assignments" {
  description = "A map of role assignments to create on the <RESOURCE>. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n\n- role_definition_id_or_name - The ID or name of the role definition to assign to the principal.\n- principal_id - The ID of the principal to assign the role to.\n- description - (Optional) The description of the role assignment.\n- skip_service_principal_aad_check - (Optional) If set to true, skips the Azure Active Directory check for the service principal in the tenant. Defaults to false.\n- condition - (Optional) The condition which will be used to scope the role assignment.\n- condition_version - (Optional) The version of the condition syntax. Leave as null if you are not using a condition, if you are then valid values are '2.0'.\n- delegated_managed_identity_resource_id - (Optional) The delegated Azure Resource Id which contains a Managed Identity. Changing this forces a new resource to be created. This field is only used in cross-tenant scenario.\n- principal_type - (Optional) The type of the principal_id. Possible values are User, Group and ServicePrincipal. It is necessary to explicitly set this attribute when creating role assignments if the principal creating the assignment is constrained by ABAC rules that filters on the PrincipalType attribute.\n\n> Note: only set skip_service_principal_aad_check to true if you are assigning a role to a service principal.\n"
  type = map(object({
    role_definition_id_or_name             = string
    principal_id                           = string
    description                            = optional(string, null)
    skip_service_principal_aad_check       = optional(bool, false)
    condition                              = optional(string, null)
    condition_version                      = optional(string, null)
    delegated_managed_identity_resource_id = optional(string, null)
    principal_type                         = optional(string, null)
  }))
  default = {}
}

variable "secondary_zone" {
  description = "This value represents the secondary zone in a stretch cluster deployment."
  type        = number
  default     = null
}

variable "segments" {
  description = "This map object describes the additional segments to configure on the private cloud. It can remain unconfigured or define one or more new network segments. Defaults to unconfigured. If the connected_gateway value is left undefined, the configuration will default to using the default T1 gateway provisioned as part of the managed service.\n\n- <map key> - Provide a key value that will be used as the segment name\n  - display_name       = (Required) - The display name for the dhcp configuration being created\n  - gateway_address    = (Required) - The CIDR range to use for the segment, starting with the gateway address.  Example: 10.20.0.1/24 **notice the range starts with 1 and not 0**.\n  - dhcp_ranges        = (Optional) - One or more ranges of IP addresses or CIDR blocks entered as a list of string\n  - connected_gateway  = (Optional) - The name of the T1 gateway to connect this segment to.  Defaults to the managed t1 gateway if left unconfigured.\n\nExample Input:\nhcl\nsegment_1 = {\n  display_name    = \"segment_1\"\n  gateway_address = \"10.20.0.1/24\"\n  dhcp_ranges     = [\"10.20.0.5-10.20.0.100\"]\n}\nsegment_2 = {\n  display_name    = \"segment_2\"\n  gateway_address = \"10.30.0.1/24\"\n  dhcp_ranges     = [\"10.30.0.0/24\"]\n}\n\n"
  type = map(object({
    display_name      = string
    gateway_address   = string
    dhcp_ranges       = optional(list(string), [])
    connected_gateway = optional(string, null)
  }))
  default = {}
}

variable "sku_name" {
  description = "The sku value for the AVS SDDC management cluster nodes. Valid values are av20, av36, av36p, av36t, av36pt, av48, av52, and av64."
  type        = string
  default     = ""
}

variable "tags" {
  description = "(Optional) Map of tags to be assigned to the AVS resources"
  type        = map(string)
  default     = null
}

variable "vcenter_identity_sources" {
  description = "A map of objects representing a list of 0-2 identity sources for configuring LDAP or LDAPs on the private cloud. The map key will be used as the name value for the identity source.\n\n- <map key> - Provide a key value that will be used as the vcenter identity source name\n  - alias             = (Required) - The domains NETBIOS name\n  - base_group_dn     = (Required) - The base distinguished name for groups\n  - base_user_dn      = (Required) - The base distinguished name for users\n  - domain            = (Required) - The fully qualified domain name for the identity source\n  - group_name        = (Optional) - The name of the LDAP group that will be added to the cloudadmins role\n  - name              = (Required) - The name to give the identity source\n  - primary_server    = (Required) - The URI of the primary server. (Ex: ldaps://server.domain.local:636)\n  - secondary_server  = (Optional) - The URI of the secondary server. (Ex: ldaps://server.domain.local:636)\n  - ssl               = (Optional) - Determines if ldap is configured to use ssl. Default to Enabled, valid values are \"Enabled\" and \"Disabled\"\n  - 'timeout'           = (Optional) - The implementation timeout value.  Defaults to 10 minutes.\n\nExample Input:\nhcl\n{\n  test.local = {\n    alias                   = \"test.local\"\n    base_group_dn           = \"dc=test,dc=local\"\n    base_user_dn            = \"dc=test,dc=local\"\n    domain                  = \"test.local\"\n    name                    = \"test.local\"\n    primary_server          = \"ldaps://dc01.testdomain.local:636\"\n    secondary_server        = \"ldaps://dc02.testdomain.local:636\"\n    ssl                     = \"Enabled\"\n  }\n}\n\n"
  type = map(object({
    alias            = string
    base_group_dn    = string
    base_user_dn     = string
    domain           = string
    group_name       = optional(string, null)
    name             = string
    primary_server   = string
    secondary_server = optional(string, null)
    ssl              = optional(string, "Enabled")
    timeout          = optional(string, "10m")
  }))
  default = {}
}

variable "vcenter_identity_sources_credentials" {
  description = "A map of objects representing the credentials used for the identity source connection. The map key should match the vcenter identity source that uses these values. Separating this to avoid terraform issues with apply on secrets.\n\n- <map key> - Provide a key value that will be used as the identity source credentials name. This value should match the identity source key where the credential will be used.\n  - ldap_user          = (Required) - \"The username for the domain user the vcenter will use to query LDAP(s)\"\n  - ldap_user_password = (Required) - \"Password to use for the domain user the vcenter will use to query LDAP(s)\"\n\nExample Input:\nhcl\n{\n  test.local = {\n    ldap_user               = \"user@test.local\"\n    ldap_user_password      = module.create_dc.ldap_user_password\n  }\n}\n\n"
  type = map(object({
    ldap_user          = string
    ldap_user_password = string
  }))
  default = {}
}

variable "vcenter_password" {
  description = "The password value to use for the cloudadmin account password in the local domain in vcenter. If this is left as null a random password will be generated for the deployment"
  type        = string
  default     = null
}

variable "vcf_firewall_license" {
  description = "  This object defines the VMware Firewall license configuration for the private cloud. By providing this data, you confirm you have purchased the above VCF license from Broadcom for use on Azure VMware Solution, and that the information provided is accurate. By providing this information, you also attest that you understand that providing false information may impact the continuity of the private cloud.\n\n- kind                   = (Optional) - The license kind. Defaults to VmwareFirewall.\n- broadcomContractNumber = (Optional) - The Broadcom contract number associated with the license.\n- broadcomSiteId         = (Optional) - The Broadcom site ID associated with the license.\n- cores                  = (Required) - The number of cores included in the license, measured per hour.\n- endDate                = (Required) - The UTC expiration date and time for the license.\n- labels                 = (Optional) - A list of label objects to associate with the license. Defaults to an empty list.\n  - key   = (Required) - The label key.\n  - value = (Required) - The label value.\n- licenseKey             = (Required) - The VMware Firewall license key.\n\nExample Input:\nhcl\nvcf_firewall_license = {\n  broadcomContractNumber = \"12345678\"\n  broadcomSiteId         = \"87654321\"\n  cores                  = 128\n  endDate                = \"2026-12-31\"\n  labels = [\n    {\n      key   = \"environment\"\n      value = \"production\"\n    }\n  ]\n  licenseKey = \"XXXXX-XXXXX-XXXXX-XXXXX-XXXXX\"\n}\n\n"
  type = object({
    kind                   = optional(string, "VmwareFirewall")
    broadcomContractNumber = optional(string)
    broadcomSiteId         = optional(string)
    cores                  = number
    endDate                = string
    labels = optional(list(object({
      key   = string
      value = string
    })), [])
    licenseKey = string
  })
  default = null
}

variable "vcf_license" {
  description = "This object defines the VCF (VMware Cloud Foundation) license configuration for the private cloud. This is required for new AVS private clouds using the VCF licensing model. By providing this data, you confirm you have purchased the above VCF license from Broadcom for use on Azure VMware Solution, and that the information provided is accurate. By providing this information, you also attest that you understand that providing false information may impact the continuity of the private cloud.\n- kind                   = (Optional) - The kind of VCF license. Defaults to \"vcf5\".\n- broadcomContractNumber = (Required) - The Broadcom contract number associated with the license.\n- broadcomSiteId         = (Required) - The Broadcom site ID associated with the license.\n- cores                  = (Required) - The number of cores covered by the license.\n- endDate                = (Required) - The end date of the license in ISO 8601 format (e.g., \"2026-12-31\").\n- labels                 = (Optional) - A list of label objects to associate with the license. Defaults to an empty list.\n  - key   = (Required) - The label key.\n  - value = (Required) - The label value.\n- licenseKey             = (Required) - The VCF license key string.\n\nExample Input:\nhcl\nvcf_license = {\n  kind                   = \"vcf5\"\n  broadcomContractNumber = \"12345678\"\n  broadcomSiteId         = \"87654321\"\n  cores                  = 128\n  endDate                = \"2026-12-31\"\n  labels = [\n    {\n      key   = \"environment\"\n      value = \"production\"\n    }\n  ]\n  licenseKey = \"XXXXX-XXXXX-XXXXX-XXXXX-XXXXX\"\n}\n\n"
  type = object({
    kind                   = optional(string, "vcf5")
    broadcomContractNumber = string
    broadcomSiteId         = string
    cores                  = number
    endDate                = string
    labels = optional(list(object({
      key   = string
      value = string
    })), [])
    licenseKey = string
  })
  default = null
}

variable "virtual_network_resource_id" {
  description = "The Azure Resource ID for the virtual network where the private cloud will be deployed. This is required when deploying a generation 2 AVS private cloud."
  type        = string
  default     = null
}
