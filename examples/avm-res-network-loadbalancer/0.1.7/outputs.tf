output "azurerm_lb" {
  value       = module.avm-res-network-loadbalancer.azurerm_lb
  description = "Outputs the entire Azure Load Balancer resource"
}

output "azurerm_lb_backend_address_pool" {
  value       = module.avm-res-network-loadbalancer.azurerm_lb_backend_address_pool
  description = "Outputs each backend address pool in its entirety"
}

output "azurerm_lb_nat_rule" {
  value       = module.avm-res-network-loadbalancer.azurerm_lb_nat_rule
  description = "Outputs each NAT rule in its entirety"
}

output "azurerm_public_ip" {
  value       = module.avm-res-network-loadbalancer.azurerm_public_ip
  description = "Outputs each Public IP Address resource in its entirety"
}

output "name" {
  value       = module.avm-res-network-loadbalancer.name
  description = "Outputs the entire Azure Load Balancer resource"
}

output "resource" {
  value       = module.avm-res-network-loadbalancer.resource
  description = "Outputs the entire Azure Load Balancer resource"
}

output "resource_id" {
  value       = module.avm-res-network-loadbalancer.resource_id
  description = "Outputs the entire Azure Load Balancer resource"
}
