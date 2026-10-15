output "action_group_id" {
  value       = module.avm-res-containerservice-managedcluster.action_group_id
  description = "The resource ID of the action group"
}

output "cpu_alert_id" {
  value       = module.avm-res-containerservice-managedcluster.cpu_alert_id
  description = "The resource ID of the CPU usage alert"
}

output "memory_alert_id" {
  value       = module.avm-res-containerservice-managedcluster.memory_alert_id
  description = "The resource ID of the memory usage alert"
}

output "resource_id" {
  value       = module.avm-res-containerservice-managedcluster.resource_id
  description = "The resource ID of the action group created by this module"
}
