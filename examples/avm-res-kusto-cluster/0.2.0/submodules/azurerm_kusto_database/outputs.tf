output "cluster_name" {
  value       = module.avm-res-kusto-cluster.cluster_name
  description = "The name of the Kusto Cluster"
}

output "id" {
  value       = module.avm-res-kusto-cluster.id
  description = "The Kusto Cluster ID."
}

output "name" {
  value       = module.avm-res-kusto-cluster.name
  description = "The name of the database."
}

output "resource_group_name" {
  value       = module.avm-res-kusto-cluster.resource_group_name
  description = "The Resource Group where the Kusto Database exist."
}

output "size" {
  value       = module.avm-res-kusto-cluster.size
  description = "The size of the database in bytes."
}
