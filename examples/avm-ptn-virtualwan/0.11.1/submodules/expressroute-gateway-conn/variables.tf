variable "er_circuit_connections" {
  description = "Map of objects for ExpressRoute Circuit connections to connect to the Virtual WAN ExpressRoute Gateways.\n\nThe key is deliberately arbitrary to avoid issues with known after apply values. The value is an object, of which there can be multiple in the map:\n\n- name: Name for the ExpressRoute Circuit connection.\n- express_route_gateway_key: The arbitrary key specified in the map of objects variable called expressroute_gateways for the object specifying the ExpressRoute Gateway you wish to connect this circuit to.\n- express_route_circuit_peering_id: The Resource ID of the ExpressRoute Circuit Peering to connect to.\n- authorization_key: Optional authorization key for the connection.\n- enable_internet_security: Optional boolean to enable internet security for the connection, e.g. allow 0.0.0.0/0 route to be propagated to this connection. See: https://learn.microsoft.com/azure/virtual-wan/virtual-wan-expressroute-portal#to-advertise-default-route-00000-to-endpoints\n- express_route_gateway_bypass_enabled: Optional boolean to enable bypass for the ExpressRoute Gateway, a.k.a. Fast Path.\n- routing: Optional routing configuration object for the connection, which includes:\n  - associated_route_table_id: The resource ID of the Virtual Hub Route Table you wish to associate with this connection.\n  - propagated_route_table: Optional configuration objection of propagated route table configuration, which includes:\n    - route_table_ids: Optional list of resource IDs of the Virtual Hub Route Tables you wish to propagate this connection to. ()\n    - labels: Optional list of labels you wish to propagate this connection to.\n  - inbound_route_map_id: Optional resource ID of the Virtual Hub inbound route map.\n  - outbound_route_map_id: Optional resource ID of the Virtual Hub outbound route map.\n- routing_weight: Optional routing weight for the connection. Values between 0 and 32000 are allowed.\n\n> Note: There can be multiple objects in this map, one for each ExpressRoute Circuit connection to the Virtual WAN ExpressRoute Gateway you wish to connect together.\n  \n"
  type = map(object({
    name                                 = string
    express_route_gateway_id             = string
    express_route_circuit_peering_id     = string
    authorization_key                    = optional(string)
    enable_internet_security             = optional(bool)
    express_route_gateway_bypass_enabled = optional(bool)
    routing = optional(object({
      associated_route_table_id = string
      propagated_route_table = optional(object({
        route_table_ids = optional(list(string))
        labels          = optional(list(string))
      }))
      inbound_route_map_id  = optional(string)
      outbound_route_map_id = optional(string)
    }))
    routing_weight = optional(number)
  }))
  default = {}
}
