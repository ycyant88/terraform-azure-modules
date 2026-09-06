output "name" {
  value       = module.avm-ptn-cicd-agents-and-runners.name
  description = "The name of the container app job."
}

output "placeholder_job_name" {
  value       = module.avm-ptn-cicd-agents-and-runners.placeholder_job_name
  description = "The name of the placeholder job."
}

output "placeholder_job_resource" {
  value       = module.avm-ptn-cicd-agents-and-runners.placeholder_job_resource
  description = "The placeholder job resource."
}

output "placeholder_job_resource_id" {
  value       = module.avm-ptn-cicd-agents-and-runners.placeholder_job_resource_id
  description = "The resource id of the placeholder job."
}

output "resource_id" {
  value       = module.avm-ptn-cicd-agents-and-runners.resource_id
  description = "The resource id of the container app job."
}

output "runner_job_resource" {
  value       = module.avm-ptn-cicd-agents-and-runners.runner_job_resource
  description = "The job resource."
}
