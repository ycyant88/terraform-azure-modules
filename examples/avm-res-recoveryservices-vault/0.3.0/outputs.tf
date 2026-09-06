output "private_endpoints" {
  value       = module.avm-res-recoveryservices-vault.private_endpoints
  description = "  A map of private endpoints. The map key is the supplied input to var.private_endpoints. The map value is the entire azurerm_private_endpoint resource.\"\r\n"
}

output "resource" {
  value       = module.avm-res-recoveryservices-vault.resource
  description = "resource Id output"
}

output "resource_id" {
  value       = module.avm-res-recoveryservices-vault.resource_id
  description = "resource Id output"
}
