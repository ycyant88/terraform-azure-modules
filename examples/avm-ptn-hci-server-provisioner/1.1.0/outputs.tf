output "resource_id" {
  value       = module.avm-ptn-hci-server-provisioner.resource_id
  description = "This is the full output for the resource."
}

output "server" {
  value       = module.avm-ptn-hci-server-provisioner.server
  description = "The arc server object"
}
