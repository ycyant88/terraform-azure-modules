output "login_server" {
  value       = module.avm-ptn-cicd-agents-and-runners.login_server
  description = "The login server of the container registry"
}

output "name" {
  value       = module.avm-ptn-cicd-agents-and-runners.name
  description = "The name of the container registry"
}

output "resource_id" {
  value       = module.avm-ptn-cicd-agents-and-runners.resource_id
  description = "The ID of the container registry"
}
