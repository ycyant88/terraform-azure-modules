output "name" {
  value       = module.avm-res-cognitiveservices-account.name
  description = "The name of the Cognitive Services deployment."
}

output "resource" {
  value       = module.avm-res-cognitiveservices-account.resource
  description = "The deployment resource shaped to match the AzureRM cognitive deployment schema."
}

output "resource_id" {
  value       = module.avm-res-cognitiveservices-account.resource_id
  description = "The resource ID of the Cognitive Services deployment."
}
