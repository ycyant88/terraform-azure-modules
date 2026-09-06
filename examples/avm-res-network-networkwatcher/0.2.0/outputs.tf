output "resource" {
  value       = module.avm-res-network-networkwatcher.resource
  description = "The network watcher resource"
}

output "resource_connection_monitor" {
  value       = module.avm-res-network-networkwatcher.resource_connection_monitor
  description = "This is the full output for the connection monitor resources."
}

output "resource_flow_log" {
  value       = module.avm-res-network-networkwatcher.resource_flow_log
  description = "This is the full output for the flow log resources."
}

output "resource_id" {
  value       = module.avm-res-network-networkwatcher.resource_id
  description = "The resource id of the Network Watcher"
}
