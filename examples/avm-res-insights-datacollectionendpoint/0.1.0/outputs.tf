output "configuration_access_endpoint" {
  value       = module.avm-res-insights-datacollectionendpoint.configuration_access_endpoint
  description = "TThe endpoint used for accessing configuration."
}

output "immutable_id" {
  value       = module.avm-res-insights-datacollectionendpoint.immutable_id
  description = "The immutable ID of the Data Collection Endpoint."
}

output "logs_ingestion_endpoint" {
  value       = module.avm-res-insights-datacollectionendpoint.logs_ingestion_endpoint
  description = "The endpoint used for ingesting logs"
}

output "resource_id" {
  value       = module.avm-res-insights-datacollectionendpoint.resource_id
  description = "This is the full output for the resource."
}
