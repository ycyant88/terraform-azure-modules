output "active_slot" {
  value       = module.avm-res-web-site.active_slot
  description = "The active slot resource ID."
}

output "custom_domain_verification_id" {
  value       = module.avm-res-web-site.custom_domain_verification_id
  description = "The custom domain verification ID for the App Service. Use this value to create\nan asuid.<custom-hostname> TXT record in your DNS zone before binding a custom\ndomain via var.custom_domains. See the custom_domains variable documentation\nfor details on the DNS prerequisites that Azure enforces.\n\nThis output is sensitive, matching how the azurerm provider treats\ncustom_domain_verification_id on its App Service resources. If you need to\npublish it, for example into a DNS TXT record resource whose value is not itself\nsensitive, wrap it in nonsensitive().\n"
}

output "deployment_slots" {
  value       = module.avm-res-web-site.deployment_slots
  description = "A map of deployment slots with their names and resource IDs. The map key is the supplied input to var.deployment_slots."
}

output "identity_principal_id" {
  value       = module.avm-res-web-site.identity_principal_id
  description = "DEPRECATED, use system_assigned_mi_principal_id instead; the principal ID of\nthe site's system-assigned managed identity, or null when the site has none.\n\nBoth outputs evaluate the same expression. AVM prescribes\nsystem_assigned_mi_principal_id as the Terraform name for this output\n([RMFR7](https://azure.github.io/Azure-Verified-Modules/spec/RMFR7)), so new\nconfigurations should use that name. This alias is retained for existing\nconsumers; removing it would be a breaking change and would be announced as\none.\n"
}

output "kind" {
  value       = module.avm-res-web-site.kind
  description = "The kind of app service."
}

output "location" {
  value       = module.avm-res-web-site.location
  description = "The location of the resource."
}

output "name" {
  value       = module.avm-res-web-site.name
  description = "The name of the resource."
}

output "os_type" {
  value       = module.avm-res-web-site.os_type
  description = "The operating system type of the resource."
}

output "private_endpoints" {
  value       = module.avm-res-web-site.private_endpoints
  description = "A map of private endpoints. The map key is the supplied input to var.private_endpoints."
}

output "resource" {
  value       = module.avm-res-web-site.resource
  description = "This is the full output for the resource."
}

output "resource_id" {
  value       = module.avm-res-web-site.resource_id
  description = "The resource ID of the App Service."
}

output "resource_uri" {
  value       = module.avm-res-web-site.resource_uri
  description = "The default hostname of the resource."
}

output "system_assigned_mi_principal_id" {
  value       = module.avm-res-web-site.system_assigned_mi_principal_id
  description = "The principal ID of the site's system-assigned managed identity, or null when\nthe site has none.\n\nThis is the output name AVM prescribes\n([RMFR7](https://azure.github.io/Azure-Verified-Modules/spec/RMFR7)). Prefer it\nover the deprecated identity_principal_id alias.\n"
}

output "system_assigned_mi_principal_id_slots" {
  value       = module.avm-res-web-site.system_assigned_mi_principal_id_slots
  description = "Map of system-assigned managed identity principal IDs for deployment slots."
}
