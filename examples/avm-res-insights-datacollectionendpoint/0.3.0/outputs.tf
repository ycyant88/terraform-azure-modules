output "configuration_access_endpoint" {
  value       = module.avm-res-insights-datacollectionendpoint.configuration_access_endpoint
  description = "The endpoint used for accessing configuration."
}

output "logs_ingestion_endpoint" {
  value       = module.avm-res-insights-datacollectionendpoint.logs_ingestion_endpoint
  description = "The endpoint used for ingesting logs."
}

output "metrics_ingestion_endpoint" {
  value       = module.avm-res-insights-datacollectionendpoint.metrics_ingestion_endpoint
  description = "The endpoint used for ingesting metrics."
}

output "name" {
  value       = module.avm-res-insights-datacollectionendpoint.name
  description = "The name of the data collection endpoint."
}

output "resource" {
  value       = module.avm-res-insights-datacollectionendpoint.resource
  description = "This is the full output for the resource."
}

output "resource_id" {
  value       = module.avm-res-insights-datacollectionendpoint.resource_id
  description = "The resource ID of the data collection endpoint."
}
