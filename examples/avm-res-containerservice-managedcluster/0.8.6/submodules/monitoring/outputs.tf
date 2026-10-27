output "container_insights_dcr_id" {
  value       = module.avm-res-containerservice-managedcluster.container_insights_dcr_id
  description = "The resource ID of the Container Insights data collection rule"
}

output "data_collection_endpoint_id" {
  value       = module.avm-res-containerservice-managedcluster.data_collection_endpoint_id
  description = "The resource ID of the data collection endpoint"
}

output "data_collection_endpoint_name" {
  value       = module.avm-res-containerservice-managedcluster.data_collection_endpoint_name
  description = "The name of the data collection endpoint."
}

output "data_collection_rule_id" {
  value       = module.avm-res-containerservice-managedcluster.data_collection_rule_id
  description = "The resource ID of the data collection rule"
}

output "data_collection_rule_name" {
  value       = module.avm-res-containerservice-managedcluster.data_collection_rule_name
  description = "The name of the data collection rule."
}

output "prometheus_rule_group_node_id" {
  value       = module.avm-res-containerservice-managedcluster.prometheus_rule_group_node_id
  description = "The resource ID of the node Prometheus rule group"
}

output "prometheus_rule_group_ux_id" {
  value       = module.avm-res-containerservice-managedcluster.prometheus_rule_group_ux_id
  description = "The resource ID of the UX Prometheus rule group"
}

output "resource_id" {
  value       = module.avm-res-containerservice-managedcluster.resource_id
  description = "The resource ID of the primary data collection rule created by this module"
}
