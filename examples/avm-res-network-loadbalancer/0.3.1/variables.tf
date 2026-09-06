variable "backend_address_pool_addresses" {
  description = "  A map of backend address pool addresses to associate with the backend address pool\n\n  - name: (Optional) The name of the backend address pool address, if adding an address. Changing this forces a new backend address pool address to be created.\n  - backend_address_pool_object_name: (Optional) The name of the backend address pool object within the virtual network. Changing this forces a new backend address pool address to be created.\n  - ip_address: (Optional) The static IP address which should be allocated to the backend address pool.\n  - virtual_network_resource_id: (Optional) The ID of the virtual network that the backend address pool address should be associated with. Helps with mapping to correct backend pool.\n\n  terraform\n  backend_address_pool_addresses = {\n    address1 = {\n      name                      = \"backend_vm_address\"\n      backend_address_pool_object_name = \"bepool_1\"\n      ip_address                = \"10.10.1.5\"\n    }\n  }\n  \n"
  type = map(object({
    name                             = optional(string)
    backend_address_pool_object_name = optional(string)
    ip_address                       = optional(string)
    virtual_network_resource_id      = optional(string)
  }))
  default = {}
}

variable "backend_address_pool_configuration" {
  description = "  String variable that determines the target virtual network for potential backend pools, at the load balancer level.\n  You can specify the virutal_network_resource_id at the pool level or backend address level.\n  If using network interfaces, leave this variable empty.\n"
  type        = string
  default     = null
}

variable "backend_address_pool_network_interfaces" {
  description = "  A map of objects that associates one or more backend address pool network interfaces\n\n  - backend_address_pool_object_name: (Optional) The name of the backend address pool object that this network interface should be associated with\n  - ip_configuration_name: (Optional) The name of the IP configuration that this network interface should be associated with\n  - network_interface_resource_id: (Optional) The ID of the network interface that should be associated with the backend address pool\n\n  terraform\n  backend_address_pool_network_interfaces = {\n    node1 = {\n      backend_address_pool_object_name = \"/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/loadBalancers/{loadBalancerName}/backendAddressPools/{backendAddressPoolName}\"\n      ip_configuration_name = \"ipconfig1\"\n      network_interface_resource_id = \"/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/networkInterfaces/{networkInterfaceName}\"\n    }\n  }\n  \n"
  type = map(object({
    backend_address_pool_object_name = optional(string)
    ip_configuration_name            = optional(string)
    network_interface_resource_id    = optional(string)
  }))
  default = {}
}

variable "backend_address_pools" {
  description = "  A map of objects that creates one or more backend pools\n\n  - name: (Optional) The name of the backend address pool to create\n  - virtual_network_resource_id: (Optional) The ID of the virtual network that the backend pool should be associated with. Sets pool to use only backend addresses via private IP. Leave empty if using network interfaces or mix of network interfaces and backend addresses.\n  - tunnel_interfaces: (Optional) A map of objects that creates one or more tunnel interfaces for the backend pool\n    - identifier: (Optional) The identifier of the tunnel interface\n    - type: (Optional) The type of the tunnel interface\n    - protocol: (Optional) The protocol of the tunnel interface\n    - port: (Optional) The port of the tunnel interface\n\n  terraform\n  backend_address_pools = {\n    pool1 = {\n      name = \"bepool1\"\n      tunnel_interfaces = {\n        internal_tunnel = {\n          identifier = 800\n          type       = \"Internal\"\n          protocol   = \"VXLAN\"\n          port       = 10800\n        }\n        external_tunnel = {\n          identifier = 801\n          type       = \"External\"\n          protocol   = \"VXLAN\"\n          port       = 10801\n        }\n      }\n    }\n  }\n  \n"
  type = map(object({
    name                        = optional(string, "bepool-1")
    virtual_network_resource_id = optional(string)
    tunnel_interfaces = optional(map(object({
      identifier = optional(number)
      type       = optional(string)
      protocol   = optional(string)
      port       = optional(number)
    })), {})
  }))
  default = {}
}

variable "diagnostic_settings" {
  description = "  A map of objects that manage a Diagnostic Setting.\n\n  - name: (Optional) The name of the diagnostic setting.\n  - log_groups: (Optional) A set of log groups. Defaults to a set containing \"allLogs\".\n  - metric_categories: (Optional) A set of metric categories. Defaults to a set containing \"AllMetrics\".\n  - log_analytics_destination_type: (Optional) The destination type for log analytics. Defaults to \"Dedicated\".\n  - workspace_resource_id: (Optional) The resource ID of the workspace. Defaults to null. This is a required field if storage_account_resource_id, event_hub_authorization_rule_resource_id, and marketplace_partner_resource_id are not set.\n  - storage_account_resource_id: (Optional) The resource ID of the storage account. Defaults to null. This is a required field if workspace_resource_id, event_hub_authorization_rule_resource_id, and marketplace_partner_resource_id are not set.\n  - event_hub_authorization_rule_resource_id: (Optional) The resource ID of the event hub authorization rule. Defaults to null. This is a required field if workspace_resource_id, storage_account_resource_id, and marketplace_partner_resource_id are not set.\n  - event_hub_name: (Optional) The name of the event hub. Defaults to null.\n  - marketplace_partner_resource_id: (Optional) The resource ID of the marketplace partner. Defaults to null. This is a required field if workspace_resource_id, storage_account_resource_id, and event_hub_authorization_rule_resource_id are not set.\n\n  Please note that at least one of workspace_resource_id, storage_account_resource_id, marketplace_partner_resource_id, or event_hub_authorization_rule_resource_id must be set.\n\n  terraform\n  diagnostic_settings = {\n    diag_setting_1 = {\n      name                                     = \"diagSetting1\"\n      log_groups                               = [\"allLogs\"]\n      metric_categories                        = [\"AllMetrics\"]\n      log_analytics_destination_type           = \"Dedicated\"\n      workspace_resource_id                    = \"/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.OperationalInsights/workspaces/{workspaceName}\"\n      storage_account_resource_id              = \"/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Storage/storageAccounts/{storageAccountName}\"\n      event_hub_authorization_rule_resource_id = \"/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.EventHub/namespaces/{namespaceName}/eventhubs/{eventHubName}/authorizationrules/{authorizationRuleName}\"\n      event_hub_name                           = \"{eventHubName}\"\n      marketplace_partner_resource_id          = \"/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/{partnerResourceProvider}/{partnerResourceType}/{partnerResourceName}\"\n    }\n  }\n  \n"
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

variable "edge_zone" {
  description = "  Specifies the Edge Zone within the Azure Region where this Public IP and Load Balancer should exist.\n  Changing this forces new resources to be created.\n"
  type        = string
  default     = null
}

variable "enable_telemetry" {
  description = "  This variable controls whether or not telemetry is enabled for the module.\n  For more information see https://aka.ms/avm/telemetry.\n  If it is set to false, then no telemetry will be collected.\n"
  type        = bool
  default     = true
}

variable "frontend_ip_configurations" {
  description = "  A map of objects that builds frontend ip configurations for the load balancer. \n  You need at least one frontend ip configuration to deploy a load balancer.\n\n  - name: (Optional) The name of the frontend IP configuration. Changing this forces a new resource to be created\n  - frontend_private_ip_address: (Optional) A string parameter that is the private IP address to assign to the Load Balancer. The last one and first four IPs in any range are reserved and cannot be manually assigned.\n  - frontend_private_ip_address_version: (Optional) A string parameter that is the version of IP that the private IP address is. Possible values are IPv4 or IPv6\n  - frontend_private_ip_address_allocation: (Optional) A string parameter that is the allocation method for the private IP address used by this Load Balancer. Possible values as Dynamic or Static\n  - frontend_private_ip_subnet_resource_id: (Optional) A string parameter that is the ID of the subnet which should be associated with the IP configuration. If desired to use the same subnet for each frontend ip configuration, use frontend_subnet_resource_id, or use frontend_vnet_name and frontend_subnet_name. If for public ip configuration, leave parameter empty/null.\n  - public_ip_address_resource_name: (Optional) A string parameter that is the name of the public ip address to be created AND associated with the Load Balancer. Changing this forces a new Public IP to be created.\n  - public_ip_address_resource_id: (Optional) A string parameter that is the ID of a public ip address which should associated with the Load Balancer.\n  - public_ip_prefix_resource_id: (Optional) A string parameter that is the ID of a public IP prefixes which should be associated with the Load Balancer. Public IP prefix can only be used with outbound rules\n  - frontend_private_ip_zones: (Optional) A  set of strings that specifies a list of availability zones in which the private IP address for this Load Balancer should be located.\n  - tags: (Optional) = A mapping of tags to assign to the individual public IP resource.\n  - create_public_ip_address: (Optional) A boolean parameter to create a new public IP address resource for the Load Balancer\n  - new_public_ip_resource_group_name: (Optional) A string for the name of the resource group to place the newly created public IP into. If null, will choose location from public_ip_address_configuration or location for the Load Balancer.\n  - new_public_ip_location: (Optional) A string parameter for the location to deploy the public IP address resource.\n  - inherit_lock: (Optional)  A boolean to determine if the lock from the Load Balancer will be inherited by the public IP.\n  - lock_type_if_not_inherited: (Optional) An optional string to determine what kind of lock will be placed on the public IP is not inherited from the Load Balancer\n  - inherit_tags: (Optional) A boolean to determine if the public IP will inherit tags from the Load Balancer.\n  - edge_zone: (Optional) A string that specifies the Edge Zone within the Azure Region where this public IP should exist. Changing this forces a new Public IP to be created.\n  - zones: (Optional) A list of strings that contains the availability zone to allocate the public IP in. Changing this forces a new resource to be created.\n  - role_assignments: A map of objects that assigns a given principal (user or group) to a given role.\n    - role_definition_id_or_name: The ID or name of the role definition to assign to the principal.\n    - principal_id: The ID of the principal to assign the role to.\n    - description: (Optional) A description of the role assignment.\n    - skip_service_principal_aad_check: (Optional) If set to true, skips the Azure Active Directory check for the service principal in the tenant. This should only be set to true if using a service principal. Defaults to false.\n    - condition: (Optional) A condition that will be used to scope the role assignment.\n    - condition_version: (Optional) The version of the condition syntax. Valid values are '2.0'. Defaults to null.\n    - delegated_managed_identity_resource_id: (Optional) The resource ID of the delegated managed identity.\n  - diagnostic_settings: A map of objects that manage a Diagnostic Setting.\n    - name: (Optional) The name of the diagnostic setting.\n    - log_groups: (Optional) A set of log groups. Defaults to a set containing \"allLogs\".\n    - metric_categories: (Optional) A set of metric categories. Defaults to a set containing \"AllMetrics\".\n    - log_analytics_destination_type: (Optional) The destination type for log analytics. Defaults to \"Dedicated\".\n    - workspace_resource_id: (Optional) The resource ID of the workspace. Defaults to null. This is a required field if storage_account_resource_id, event_hub_authorization_rule_resource_id, and marketplace_partner_resource_id are not set.\n    - storage_account_resource_id: (Optional) The resource ID of the storage account. Defaults to null. This is a required field if workspace_resource_id, event_hub_authorization_rule_resource_id, and marketplace_partner_resource_id are not set.\n    - event_hub_authorization_rule_resource_id: (Optional) The resource ID of the event hub authorization rule. Defaults to null. This is a required field if workspace_resource_id, storage_account_resource_id, and marketplace_partner_resource_id are not set.\n    - event_hub_name: (Optional) The name of the event hub. Defaults to null.\n    - marketplace_partner_resource_id: (Optional) The resource ID of the marketplace partner. Defaults to null. This is a required field if workspace_resource_id, storage_account_resource_id, and event_hub_authorization_rule_resource_id are not set.\n\n  Example Input:\n  terraform\n  # Standard Regional IPv4 Private Ip Configuration\n  frontend_ip_configurations = {\n    frontend_configuration_1 = {\n      name = \"internal_lb_private_ip_1_config\"\n      frontend_private_ip_address_version    = \"IPv4\"\n      frontend_private_ip_address_allocation = \"Dynamic\"\n    }\n\n  # Standard Regional IPv4 Public IP Frontend IP Configuration\n  frontend_ip_configurations = {\n    frontend_configuration_1 = {\n      name                     = \"public_lb_public_ip_1_config\"\n      public_ip_address_name = \"public_lb_public_ip_1\"\n      create_public_ip_address = true\n    }\n  }\n  \n"
  type = map(object({
    name                                               = optional(string)
    frontend_private_ip_address                        = optional(string)
    frontend_private_ip_address_version                = optional(string)
    frontend_private_ip_address_allocation             = optional(string, "Dynamic")
    frontend_private_ip_subnet_resource_id             = optional(string)
    gateway_load_balancer_frontend_ip_configuration_id = optional(string)
    public_ip_address_resource_name                    = optional(string)
    public_ip_address_resource_id                      = optional(string)
    public_ip_prefix_resource_id                       = optional(string)
    # frontend_private_ip_zones                                  = optional(set(string), [1, 2, 3])
    tags                              = optional(map(any), {})
    create_public_ip_address          = optional(bool, false)
    new_public_ip_resource_group_name = optional(string)
    new_public_ip_location            = optional(string)
    inherit_lock                      = optional(bool, true)
    lock_type_if_not_inherited        = optional(string, null)
    inherit_tags                      = optional(bool, true)
    edge_zone                         = optional(string)
    zones                             = optional(list(string), ["1", "2", "3"])

    role_assignments = optional(map(object({
      role_definition_id_or_name             = string
      principal_id                           = string
      description                            = optional(string, null)
      skip_service_principal_aad_check       = optional(bool, false) # only set to true IF using service principal
      condition                              = optional(string, null)
      condition_version                      = optional(string, null) # Valid values are 2.0
      delegated_managed_identity_resource_id = optional(string, null)
    })), {})

    diagnostic_settings = optional(map(object({
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
    })), {})
  }))
  default = ""
}

variable "frontend_subnet_resource_id" {
  description = "  (Optional) The frontend subnet id to use when in private mode. Can be used for all ip configurations that will use the same subnet. frontend_private_ip_subnet_resource_id can be set per frontend configuration for private ip.\n"
  type        = string
  default     = null
}

variable "lb_nat_pools" {
  description = "  A map of objects that define the inbound NAT rules for a Load Balancer. Each object has the following\n\n  - name: (Optional) The name of the Load Balancer rule. Changing this forces a new resource to be created.\n  - frontend_ip_configuration_name: (Optional) The name of the frontend IP configuration to which the rule is associated with\n  - protocol: (Optional) The transport protocol for the external endpoint. Possible values are All, Tcp, or Udp.\n  - frontend_port_start: (Optional) The first port number in the range of external ports that will be used to provide Inbound NAT to NICs associated with this Load Balancer. Possible values range between 1 and 65534, inclusive.\n  - frontend_port_end: (Optional) The last port number in the range of external ports that will be used to provide Inbound NAT to NICs associated with this Load Balancer. Possible values range between 1 and 65534, inclusive.\n  - backend_port: (Optional) The port used for the internal endpoint. Possible values range between 1 and 65535, inclusive.\n  - idle_timeout_in_minutes: (Optional) Specifies the idle timeout in minutes for TCP connections. Valid values are between 4 and 30 minutes. Defaults to 4 minutes.\n  - enable_floating_ip: (Optional) A boolean parameter to determine if there are floating IPs enabled for this Load Balancer NAT rule. A \"floating\u201d IP is reassigned to a secondary server in case the primary server fails. Required to configure a SQL AlwaysOn Availability Group. Defaults to false.\n  - enable_tcp_reset: (Optional) A boolean to determine if TCP Reset is enabled for this Load Balancer rule. Defaults to false.\n  \n  terraform\n  lb_nat_pools = {\n    lb_nat_pool_1 = {\n      resource_group_name            = azurerm_resource_group.example.name\n      loadbalancer_id                = azurerm_lb.example.id\n      name                           = \"SampleApplicationPool\"\n      protocol                       = \"Tcp\"\n      frontend_port_start            = 80\n      frontend_port_end              = 81\n      backend_port                   = 8080\n      frontend_ip_configuration_name = \"PublicIPAddress\"\n    }\n  }\n  \n"
  type = map(object({
    name                           = optional(string)
    frontend_ip_configuration_name = optional(string)
    protocol                       = optional(string, "Tcp")
    frontend_port_start            = optional(number, 3000)
    frontend_port_end              = optional(number, 3389)
    backend_port                   = optional(number, 3389)
    idle_timeout_in_minutes        = optional(number, 4)
    enable_floating_ip             = optional(bool, false)
    enable_tcp_reset               = optional(bool, false)
  }))
  default = {}
}

variable "lb_nat_rules" {
  description = "  A map of objects that specifies the creation of NAT rules.\n\n  - name: (Optional) The name of the NAT rule. Changing this forces a new resource to be created\n  - frontend_ip_configuration_name: (Optional) The name of the frontend IP configuration exposing this rule\n  - protocol: (Optional) The transport protocol front the external endpoint. Possible values are All, Tcp, or Udp\n  - frontend_port: (Optional) The port for the external endpoint. Port numbers for each Rule must be unique within the Load Balancer. Possible values range between 1 and 65534, inclusive. Leave null or 0 if protocol is set to All\n  - backend_port: (Optional) The port used for internal connections on the endpoint. Possible values range between 1 and 65535, inclusive. Leave null or 0 if protocol is set to All\n  - frontend_port_start: (Optional) The port range start for the external endpoint. This property is used together with BackendAddressPool and FrontendPortRangeEnd. Individual inbound NAT rule port mappings will be created for each backend address from BackendAddressPool. Acceptable values range from 1 to 65534, inclusive.\n  - frontend_port_end: (Optional) The port range end for the external endpoint. This property is used together with BackendAddressPool and FrontendPortRangeStart. Individual inbound NAT rule port mappings will be created for each backend address from BackendAddressPool. Acceptable values range from 1 to 65534, inclusive.\n  - backend_address_pool_resource_id: (Optional) The ID of the backend address pool that this NAT rule references\n  - backend_address_pool_object_name: (Optional) The name of the backend address pool that this NAT rule references\n  - idle_timeout_in_minutes: (Optional) Specifies the idle timeout in minutes for TCP connections. Valid values are between 4 and 30 minutes. Defaults to 4 minutes.\n  - enable_floating_ip: (Optional) A boolean parameter to determine if there are floating IPs enabled for this Load Balancer NAT rule. A \"floating\u201d IP is reassigned to a secondary server in case the primary server fails. Required to configure a SQL AlwaysOn Availability Group. Defaults to false.\n  - enable_tcp_reset: (Optional) A boolean parameter to determine if TCP Reset is enabled for this Load Balancer NAT rule. Defaults to false\n\n  terraform\n  lb_nat_rules = {\n    lb_nat_rule_1 = {\n      name                           = \"tcp_nat_rule_1\"\n      frontend_ip_configuration_name = \"internal_lb_private_ip_1_config\"\n      protocol = \"Tcp\"\n      frontend_port = 3389\n      backend_port = 3389\n    }\n  }\n  \n"
  type = map(object({
    name                             = optional(string)
    frontend_ip_configuration_name   = optional(string)
    protocol                         = optional(string)
    frontend_port                    = optional(number)
    backend_port                     = optional(number)
    frontend_port_start              = optional(number)
    frontend_port_end                = optional(number)
    backend_address_pool_resource_id = optional(string)
    backend_address_pool_object_name = optional(string)
    idle_timeout_in_minutes          = optional(number, 4)
    enable_floating_ip               = optional(bool, false)
    enable_tcp_reset                 = optional(bool, false)
  }))
  default = {}
}

variable "lb_outbound_rules" {
  description = "  A map of objects that define the outbound rules for a Load Balancer. Each object is identified by a unique key in the map and has the following properties:\n  \n  - name: (Optional) The name of the Load Balancer rule. Changing this forces a new resource to be created.\n  - frontend_ip_configuration_name: (Optional) The list of names of the frontend IP configuration to which the rule is associated with\n  - backend_address_pool_resource_id: (Optional) An ID that references a Backend Address Pool over which this Load Balancing Rule operates. Multiple backend pools only valid if Gateway SKU\n  - backend_address_pool_object_name: (Optional) A name that references a Backend Address Pool over which this Load Balancing Rule operates. Multiple backend pools only valid if Gateway SKU\n  - protocol: (Optional) The transport protocol for the external endpoint. Possible values are All, Tcp, or Udp.\n  - enable_tcp_reset: A boolean to determine if TCP Reset is enabled for this Load Balancer rule. Defaults to false.\n  - number_of_allocated_outbound_ports: (Optional) \n  - idle_timeout_in_minutes: Specifies the idle timeout in minutes for TCP connections. Valid values are between 4 and 30 minutes. Defaults to 4 minutes.\n  \n  terraform\n  lb_outbound_rules = {\n    lb_outbound_rule_1 = {\n      name = \"outbound_rule_1\"\n      frontend_ip_configurations = [\n        {\n          name = \"frontend_1\"\n        }\n      ]\n    }\n  }\n  \n"
  type = map(object({
    name                               = optional(string)
    frontend_ip_configurations         = optional(list(object({ name = optional(string) })))
    backend_address_pool_resource_id   = optional(string)
    backend_address_pool_object_name   = optional(string)
    protocol                           = optional(string, "Tcp")
    enable_tcp_reset                   = optional(bool, false)
    number_of_allocated_outbound_ports = optional(number, 1024)
    idle_timeout_in_minutes            = optional(number, 4)
  }))
  default = {}
}

variable "lb_probes" {
  description = "  A list of objects that specify the Load Balancer probes to be created.\n  Each object has 7 parameters:\n\n  - name: (Optional) The name of the probe. Changing this forces a new probe resource to be created.\n  - protocol: (Optional) Specifies the protocol of the end point. Possible values are Http, Https or Tcp. If TCP is specified, a received ACK is required for the probe to be successful. If HTTP is specified, a 200 OK response from the specified URI is required for the probe to be successful.\n  - port: (Optional) The port on which the probe queries the backend endpoint. Possible values range from 1 to 65535, inclusive.\n  - probe_threshold: (Optional) The number of consecutive successful or failed probes that allow or deny traffic to this endpoint. Possible values range from 1 to 100. The default value is 1.\n  - request_path: (Optional) The URI used for requesting health status from the backend endpoint. Required if protocol is set to Http or Https. Otherwise, it is not allowed.\n  - interval_in_seconds: (Optional) The interval, in seconds between probes to the backend endpoint for health status. The default value is 15, the minimum value is 5.\n  - number_of_probes_before_removal: (Optional) The number of failed probe attempts after which the backend endpoint is removed from rotation. The default value is 2. NumberOfProbes multiplied by intervalInSeconds value must be greater or equal to 10.Endpoints are returned to rotation when at least one probe is successful.\n\n  terraform\n  # Each type of probe\n  lb_probes = { \n    probe1 = {\n      name     = \"probe_1\"\n      protocol = \"Tcp\"\n      port     = 80\n      interval_in_seconds = 5\n    },\n    probe2 = {\n      name         = \"probe_2\"\n      protocol     = \"Http\"\n      port         = 80\n      request_path = \"/\"\n      interval_in_seconds = 5\n    },\n    probe3 = {\n      name         = \"probe_3\"\n      protocol     = \"Https\"\n      port         = 443\n      request_path = \"/\"\n      interval_in_seconds = 5\n    }\n  }\n  \n"
  type = map(object({
    name                            = optional(string)
    protocol                        = optional(string, "Tcp")
    port                            = optional(number, 80)
    interval_in_seconds             = optional(number, 15)
    probe_threshold                 = optional(number, 1)
    request_path                    = optional(string)
    number_of_probes_before_removal = optional(number, 2)
  }))
  default = {}
}

variable "lb_rules" {
  description = "  A list of objects that specifies the Load Balancer rules for the Load Balancer.\n  Each object has 14 parameters:\n\n  - name: (Optional) The name of the Load Balancer rule. Changing this forces a new resource to be created.\n  - frontend_ip_configuration_name: (Optional) The name of the frontend IP configuration to which the rule is associated with\n  - protocol: (Optional) The transport protocol for the external endpoint. Possible values are All, Tcp, or Udp.\n  - frontend_port: (Optional) The port for the external endpoint. Port numbers for each Rule must be unique within the Load Balancer. Possible values range between 0 and 65534, inclusive.\n  - backend_port: (Optional) The port used for internal connections on the endpoint. Possible values range between 0 and 65535, inclusive.\n  - backend_address_pool_resource_ids: (Optional) A list of IDs that reference to a Backend Address Pool over which this Load Balancing Rule operates. Multiple backend pools only valid if Gateway SKU\n  - backend_address_pool_object_names: (Optional) A list of names reference to a Backend Address Pool object over which this Load Balancing Rule operates. Multiple backend pools only valid if Gateway SKU\n  - probe_resource_id: The ID of the probe used by this Load balancing rule.\n  - probe_object_name: The name of the probe object used by this Load balancing rule.\n  - enable_floating_ip: (Optional) A boolean parameter to determine if there are floating IPs enabled for this Load Balancer NAT rule. A \"floating\u201d IP is reassigned to a secondary server in case the primary server fails. Required to configure a SQL AlwaysOn Availability Group. Defaults to false.\n  - idle_timeout_in_minutes: Specifies the idle timeout in minutes for TCP connections. Valid values are between 4 and 30 minutes. Defaults to 4 minutes.\n  - load_distribution: Specifies the load balancing distribution type to be used by the Load Balancer. Possible values are: Default \u2013 The load balancer is configured to use a 5 tuple hash to map traffic to available servers. SourceIP \u2013 The load balancer is configured to use a 2 tuple hash to map traffic to available servers. SourceIPProtocol \u2013 The load balancer is configured to use a 3 tuple hash to map traffic to available servers. Also known as Session Persistence, where the options are called None, Client IP and Client IP and Protocol respectively.\n  - disable_outbound_snat: A boolean to determine if snat is enabled for this Load Balancer rules. Defaults to false.\n  - enable_tcp_reset: A boolean to determine if TCP Reset is enabled for this Load Balancer rule. Defaults to false.\n\n  terraform\n  lb_rules = {\n    lb_rule_1 = {\n      name                               = \"myHTTPRule\"\n      frontend_ip_configuration_name     = \"myFrontend\"\n      backend_address_pool_object_names = [\"myBackendPool\"]\n      protocol = \"Tcp\" # default\n      frontend_port = 80\n      backend_port = 80\n      probe_object_name                = \"tcp1\"\n      idle_timeout_in_minutes = 15\n      enable_tcp_reset = true\n    }\n  }\n\n  \n"
  type = map(object({
    name                              = optional(string)
    frontend_ip_configuration_name    = optional(string)
    protocol                          = optional(string, "Tcp")
    frontend_port                     = optional(number, 3389)
    backend_port                      = optional(number, 3389)
    backend_address_pool_resource_ids = optional(list(string)) # multiple back end pools ONLY IF gateway sku load balancer
    backend_address_pool_object_names = optional(list(string)) # multiple back end pools ONLY IF gateway sku load balancer
    probe_resource_id                 = optional(string)
    probe_object_name                 = optional(string)
    enable_floating_ip                = optional(bool, false)
    idle_timeout_in_minutes           = optional(number, 4)
    load_distribution                 = optional(string, "Default")
    disable_outbound_snat             = optional(bool, false) # set `diasble_outbound_snat` to true when same frontend ip configuration is referenced by outbout rule and lb rule
    enable_tcp_reset                  = optional(bool, false)
  }))
  default = {}
}

variable "location" {
  description = "  The Azure region where the resources should be deployed.\n  The full list of Azure regions can be found at: https://azure.microsoft.com/regions\n"
  type        = string
  default     = ""
}

variable "lock" {
  description = "  An object that sets a lock for the Load Balancer.\n\n  - name: The name of the lock\n  - kind: The type of lock to be created. Accepted values are CanNotDelete or ReadOnly. Defaults to None if kind is not set.\n\n  terraform\n  # Delete Lock for the Load Balancer\n  lock = {\n    name = \"lock-{resourcename}\"\n    kind = \"CanNotDelete\"\n  }\n  \n"
  type = object({
    kind = string
    name = optional(string, null)
  })
  default = null
}

variable "name" {
  description = "  The name of the load balancer.\n"
  type        = string
  default     = ""
}

variable "public_ip_address_configuration" {
  description = "  An object variable that configures the settings that will be the same for all public IPs for this Load Balancer\n\n  - allocation_method: (Optional) The allocation method for this IP address. Possible valuse are Static or Dynamic\n  - resource_group_name: (Optional) Specifies the resource group to deploy all of the public IP addresses to be created\n  - ddos_protection_mode: (Optional) The DDoS protection mode of the public IP. Possible values are Disabled, Enabled, and VirtualNetworkInherited. Defaults to VirtualNetworkInherited.\n  - ddos_protection_plan_resource_id: (Optional) The ID of DDoS protection plan associated with the public IP\n  - domain_name_label: (Optional) The label for the Domain Name. This will be used to make up the FQDN. If a domain name label is specified, an A DNS record is created for the public IP in the Microsoft Azure DNS system.\n  - idle_timeout_in_minutes: (Optional) Specifies the timeout for the TCP idle connection. The value can be set between 4 and 30 minutes.\n  - ip_tags: (Optional) A mapping of IP tags to assign to the public IP. Changing this forces a new resource to be created.\n  - ip_version: (Optional) The version of IP to use for the Public IPs. Possible valuse are IPv4 or IPv6. Changing this forces a new resource to be created.\n  - public_ip_prefix_resource_id: (Optional) If specified then public IP address allocated will be provided from the public IP prefix resource. Changing this forces a new resource to be created.\n  - reverse_fqdn: (Optional) A fully qualified domain name that resolves to this public IP address. If the reverseFqdn is specified, then a PTR DNS record is created pointing from the IP address in the in-addr.arpa domain to the reverse FQDN.\n  - sku: (Optional) The SKU of the Public IP. Accepted values are Basic and Standard. Defaults to Standard. Changing this forces a new resource to be created.\n  - sku_tier: (Optional) The SKU Tier that should be used for the Public IP. Possible values are Regional and Global. Defaults to Regional. Changing this forces a new resource to be created.\n  - tags: (Optional) The collection of tags to be assigned to all every Public IP.\n\n  Example Input:\n  terraform\n  # Standard Regional IPv4 Public IP address Configuration\n  public_ip_address_configuration = {\n    allocation_method = \"Static\"\n    ddos_protection_mode = \"VirtualNetworkInherited\"\n    idle_timeout_in_minutes = 30\n    ip_version = \"IPv4\"\n    sku_tier = \"Regional\"\n  }\n  \n"
  type = object({
    resource_group_name              = optional(string)
    allocation_method                = optional(string, "Static")
    ddos_protection_mode             = optional(string, "VirtualNetworkInherited")
    ddos_protection_plan_resource_id = optional(string)
    domain_name_label                = optional(string)
    idle_timeout_in_minutes          = optional(number, 4)
    ip_tags                          = optional(map(string))
    ip_version                       = optional(string, "IPv4")
    public_ip_prefix_resource_id     = optional(string)
    reverse_fqdn                     = optional(string)
    sku                              = optional(string, "Standard")
    sku_tier                         = optional(string, "Regional")
    tags                             = optional(map(any), {})
  })
  default = {}
}

variable "resource_group_name" {
  description = "  The name of the resource group where the load balancer will be deployed.\n"
  type        = string
  default     = ""
}

variable "role_assignments" {
  description = "  A map of objects that assigns a given principal (user or group) to a given role.\n\n  - role_definition_id_or_name: The ID or name of the role definition to assign to the principal.\n  - principal_id: The ID of the principal to assign the role to.\n  - description: (Optional) A description of the role assignment.\n  - skip_service_principal_aad_check: (Optional) If set to true, skips the Azure Active Directory check for the service principal in the tenant. This should only be set to true if using a service principal. Defaults to false.\n  - condition: (Optional) A condition that will be used to scope the role assignment.\n  - condition_version: (Optional) The version of the condition syntax. Valid values are '2.0'. Defaults to null.\n  - delegated_managed_identity_resource_id: (Optional) The resource ID of the delegated managed identity.\n\n  terraform\n  role_assignments = {\n    role_assignment_1 = {\n      role_definition_id_or_name             = \"Contributor\"\n      principal_id                           = \"xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx\"\n      skip_service_principal_aad_check       = true\n    },\n    role_assignment_2 = {\n      role_definition_id_or_name             = \"Storage Blob Data Reader\"\n      principal_id                           = \"yyyyyyyy-yyyy-yyyy-yyyy-yyyyyyyyyyyy\"\n      description                            = \"Example role assignment 2 of reader role\"\n      skip_service_principal_aad_check       = false\n      condition                              = \"@Resource[Microsoft.Storage/storageAccounts/blobServices/containers:ContainerName] StringEqualsIgnoreCase 'foo_storage_container'\"\n      condition_version                      = \"2.0\"\n    }\n  }\n  \n"
  type = map(object({
    role_definition_id_or_name             = string
    principal_id                           = string
    description                            = optional(string, null)
    skip_service_principal_aad_check       = optional(bool, false) # only set to true IF using service principal
    condition                              = optional(string, null)
    condition_version                      = optional(string, null) # Valid values are 2.0
    delegated_managed_identity_resource_id = optional(string, null)
    principal_type                         = optional(string, null)
  }))
  default = {}
}

variable "sku" {
  description = "  The SKU of the Azure Load Balancer. \n  Accepted values are Basic, Standard, and Gateway.\n  Microsoft recommends Standard for production workloads.\n  Basic SKU is set to be retired 30 September 2025\n  > The Microsoft.Network/AllowGatewayLoadBalancer feature is required to be registered in order to use the Gateway SKU. The feature can only be registered by the Azure service team, please submit an Azure support ticket for that.\n"
  type        = string
  default     = "Standard"
}

variable "sku_tier" {
  description = "  String parameter that specifies the SKU tier of this Load Balancer. \n  Possible values are Global and Regional. \n  Defaults to Regional. \n  Changing this forces a new resource to be created.\n"
  type        = string
  default     = "Regional"
}

variable "tags" {
  description = "  The tags to apply to the Load Balancer.\n"
  type        = map(string)
  default     = null
}
