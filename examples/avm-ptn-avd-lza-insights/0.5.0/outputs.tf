output "logs_ingestion_endpoint" {
  value       = module.avm-ptn-avd-lza-insights.logs_ingestion_endpoint
  description = "The endpoint used to ingest logs into the Data Collection Rule."
}

output "metrics_ingestion_endpoint" {
  value       = module.avm-ptn-avd-lza-insights.metrics_ingestion_endpoint
  description = "The endpoint used to ingest metrics into the Data Collection Rule."
}

output "name" {
  value       = module.avm-ptn-avd-lza-insights.name
  description = "The name of the Monitor Data Collection Rule."
}

output "resource_id" {
  value       = module.avm-ptn-avd-lza-insights.resource_id
  description = "The resource ID of the Monitor Data Collection Rule."
}

output "rule_immutable_id" {
  value       = module.avm-ptn-avd-lza-insights.rule_immutable_id
  description = "The immutable ID that Azure assigned to the Monitor Data Collection Rule."
}

output "system_assigned_mi_principal_id" {
  value       = module.avm-ptn-avd-lza-insights.system_assigned_mi_principal_id
  description = "The principal ID of the system assigned managed identity, if one is enabled."
}
