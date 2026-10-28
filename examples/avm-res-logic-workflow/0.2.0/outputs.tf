output "resource" {
  value       = module.avm-res-logic-workflow.resource
  description = "This is the full output for the resource."
}

output "resource_id" {
  value       = module.avm-res-logic-workflow.resource_id
  description = "Resource ID of logic app"
}
