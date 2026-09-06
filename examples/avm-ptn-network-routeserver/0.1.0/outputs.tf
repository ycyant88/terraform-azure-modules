output "resource" {
  value       = module.avm-ptn-network-routeserver.resource
  description = "This is the full output for the resource. It contains the following properties:\n\n- id - type: string - The Azure Resource ID of the virtual hub resource that this route server is associated to.\n- location - type: string - The azure location of the route server resource.\n- name - type: string - The name of the route server resource.\n- tags' - type: map(string) - A tags map for any directly assigned tags for the route server resource.\n- 'virtual_router_asn - type: number - The ASN number for the route server resource. \n- virtual_router_ips - type: list(string) - A list containing the peer ip's for route server.\n"
}

output "resource_id" {
  value       = module.avm-ptn-network-routeserver.resource_id
  description = ""
}
