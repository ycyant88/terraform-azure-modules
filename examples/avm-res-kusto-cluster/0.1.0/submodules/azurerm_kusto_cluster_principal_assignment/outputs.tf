output "cluster_name" {
  value       = module.avm-res-kusto-cluster.cluster_name
  description = "The name of the cluster."
}

output "id" {
  value       = module.avm-res-kusto-cluster.id
  description = "The ID of the Kusto Cluster Principal Assignment."
}

output "name" {
  value       = module.avm-res-kusto-cluster.name
  description = "The name of the Kusto cluster principal assignment."
}

output "principal_name" {
  value       = module.avm-res-kusto-cluster.principal_name
  description = "The name of the principal."
}

output "tenant_name" {
  value       = module.avm-res-kusto-cluster.tenant_name
  description = "The name of the tenant."
}
