output "deployment_region" {
  value       = module.avm-res-avs-privatecloud.deployment_region
  description = "The region map to use for the AVS deployment. Returns no_quota if all region quota is consumed."
}

output "regions" {
  value       = module.avm-res-avs-privatecloud.regions
  description = "A map of regions with quota counts."
}

output "regions_with_quota" {
  value       = module.avm-res-avs-privatecloud.regions_with_quota
  description = "A map of regions that meet the quota requirement."
}

output "resource" {
  value       = module.avm-res-avs-privatecloud.resource
  description = "The region map to use for the AVS deployment. Returns no_quota if all region quota is consumed. Duplicating the deployment region output to comply with the AVM spec."
}

output "resource_id" {
  value       = module.avm-res-avs-privatecloud.resource_id
  description = "A map of regions that meet the quota requirement. Duplicating the regions with quota output to comply with the AVM spec."
}
