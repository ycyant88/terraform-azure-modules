output "name" {
  value       = module.avm-ptn-cicd-agents-and-runners.name
  description = "The name of the container instance"
}

output "resource" {
  value       = module.avm-ptn-cicd-agents-and-runners.resource
  description = "The container instance resource"
}

output "resource_id" {
  value       = module.avm-ptn-cicd-agents-and-runners.resource_id
  description = "The ID of the container instance"
}
