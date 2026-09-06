output "resource" {
  value       = module.avm-ptn-virtualwan.resource
  description = "Azure ExpressRoute Gateway resource name"
}

output "resource_id" {
  value       = module.avm-ptn-virtualwan.resource_id
  description = "Azure ExpressRoute Gateway resource ID"
}

output "resource_object" {
  value       = module.avm-ptn-virtualwan.resource_object
  description = "Azure ExpressRoute Gateway resource object"
}
