output "body_properties" {
  value       = module.avm-res-containerservice-managedcluster.body_properties
  description = "If output_data_only is set to true, this output will contain the properties of the resource as defined in the body. Otherwise, it will be null."
}

output "current_orchestrator_version" {
  value       = module.avm-res-containerservice-managedcluster.current_orchestrator_version
  description = "The version of Kubernetes the Agent Pool is running. If orchestratorVersion is a fully specified version <major.minor.patch>, this field will be exactly equal to it. If orchestratorVersion is <major.minor>, this field will contain the full <major.minor.patch> version being used."
}

output "local_dns_profile_state" {
  value       = module.avm-res-containerservice-managedcluster.local_dns_profile_state
  description = "System-generated state of localDNS."
}

output "name" {
  value       = module.avm-res-containerservice-managedcluster.name
  description = "The name of the resource."
}

output "node_image_version" {
  value       = module.avm-res-containerservice-managedcluster.node_image_version
  description = "The version of node image"
}

output "provisioning_state" {
  value       = module.avm-res-containerservice-managedcluster.provisioning_state
  description = "The current deployment or provisioning state."
}

output "resource_id" {
  value       = module.avm-res-containerservice-managedcluster.resource_id
  description = "The ID of the created resource."
}

output "type" {
  value       = module.avm-res-containerservice-managedcluster.type
  description = "Resource type"
}
