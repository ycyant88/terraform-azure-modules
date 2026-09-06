output "resource" {
  value       = module.avm-res-insights-autoscalesetting.resource
  description = "All attributes of the Monitor Autoscale Setting resource."
}

output "resource_id" {
  value       = module.avm-res-insights-autoscalesetting.resource_id
  description = "The ID of the Monitor Autoscale Setting."
}

output "resource_name" {
  value       = module.avm-res-insights-autoscalesetting.resource_name
  description = "The name of the Monitor Autoscale Setting."
}
