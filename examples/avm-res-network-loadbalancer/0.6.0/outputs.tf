output "backend_address_pool_resource_ids" {
  value       = module.avm-res-network-loadbalancer.backend_address_pool_resource_ids
  description = "Backend pool IDs keyed by backend_address_pools input keys. Pass these to the module that owns the NIC."
}

output "frontend_ip_configuration_resource_ids" {
  value       = module.avm-res-network-loadbalancer.frontend_ip_configuration_resource_ids
  description = "Frontend IDs keyed by frontend_ip_configurations input keys."
}

output "inbound_nat_rule_resource_ids" {
  value       = module.avm-res-network-loadbalancer.inbound_nat_rule_resource_ids
  description = "NAT rule IDs keyed by lb_nat_rules input keys (not Azure rule names)."
}

output "load_balancing_rule_resource_ids" {
  value       = module.avm-res-network-loadbalancer.load_balancing_rule_resource_ids
  description = "Load balancing rule IDs keyed by lb_rules input keys."
}

output "name" {
  value       = module.avm-res-network-loadbalancer.name
  description = "The load balancer name."
}

output "outbound_rule_resource_ids" {
  value       = module.avm-res-network-loadbalancer.outbound_rule_resource_ids
  description = "Outbound rule IDs keyed by lb_outbound_rules input keys."
}

output "probe_resource_ids" {
  value       = module.avm-res-network-loadbalancer.probe_resource_ids
  description = "Probe IDs keyed by lb_probes input keys."
}

output "resource_id" {
  value       = module.avm-res-network-loadbalancer.resource_id
  description = "The load balancer ARM resource ID."
}
