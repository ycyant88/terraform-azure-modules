output "azurerm_lb" {
  value       = module.avm-res-network-loadbalancer.azurerm_lb
  description = "Outputs the entire Azure Load Balancer resource"
}

output "azurerm_public_ip" {
  value       = module.avm-res-network-loadbalancer.azurerm_public_ip
  description = "Outputs each Public IP Address resource in it's entirety"
}
