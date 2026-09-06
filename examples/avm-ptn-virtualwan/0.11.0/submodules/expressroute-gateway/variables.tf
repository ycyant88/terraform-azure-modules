variable "expressroute_gateways" {
  description = "\nMap of objects for Express Route Gateways to deploy into the Virtual WAN Virtual Hubs that have been defined in the variable virtual_hubs.\n\nThe key is deliberately arbitrary to avoid issues with known after apply values. The value is an object, of which there can be multiple in the map:\n\n- name: Name for the ExpressRoute Gateway to deploy in the Virtual WAN Virtual Hub.\n- virtual_hub_id: The object ID of the virtual hub.\n- tags: Optional tags to apply to the ExpressRoute Gateway resource.\n- allow_non_virtual_wan_traffic: Optional boolean to configures this gateway to accept traffic from non Virtual WAN networks. Defaults to false.\n- scale_units: Optional number of scale units for the ExpressRoute Gateway. Defaults to 1. See: https://learn.microsoft.com/azure/virtual-wan/virtual-wan-expressroute-about#expressroute-gateway-performance for more information on scale units.\n\n> Note: There can be multiple objects in this map, one for each ExpressRoute Gateway you wish to deploy into the Virtual WAN Virtual Hubs that have been defined in the variable virtual_hubs.\n\n"
  type = map(object({
    name                          = string
    virtual_hub_id                = string
    location                      = string
    resource_group_name           = string
    tags                          = optional(map(string))
    allow_non_virtual_wan_traffic = optional(bool, false)
    scale_units                   = optional(number, 1)
  }))
  default = {}
}
