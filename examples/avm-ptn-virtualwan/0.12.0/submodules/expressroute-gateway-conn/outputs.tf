output "resource" {
  value       = module.avm-ptn-virtualwan.resource
  description = "Azure ExpressRoute Connection resource"
}

output "resource_id" {
  value       = module.avm-ptn-virtualwan.resource_id
  description = "Azure ExpressRoute Connection resource ID"
}
