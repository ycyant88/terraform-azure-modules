output "private_endpoints" {
  value       = module.avm-ptn-avd-lza-managementplane.private_endpoints
  description = "A map of private endpoints. The map key is the supplied input to var.private_endpoints. The map value is the entire azurerm_private_endpoint resource."
}

output "resource" {
  value       = module.avm-ptn-avd-lza-managementplane.resource
  description = "This output is the full output for the resource to allow flexibility to reference all possible values for the resource. Example usage: module.<modulename>.resource.id"
}
