output "resource" {
  value       = module.avm-res-servicebus-namespace.resource
  description = "The service bus namespace created. More info: https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/servicebus_namespace.html#attributes-reference"
}

output "resource_authorization_rules" {
  value       = module.avm-res-servicebus-namespace.resource_authorization_rules
  description = "The service bus namespace authorization rules created. More info: https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/servicebus_namespace_authorization_rule#attributes-reference"
}

output "resource_diagnostic_settings" {
  value       = module.avm-res-servicebus-namespace.resource_diagnostic_settings
  description = "The diagnostic settings created. More info: https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_diagnostic_setting#attributes-reference"
}

output "resource_locks" {
  value       = module.avm-res-servicebus-namespace.resource_locks
  description = "The management locks created. More info: https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/management_lock#attributes-reference"
}

output "resource_private_endpoints" {
  value       = module.avm-res-servicebus-namespace.resource_private_endpoints
  description = "A map of the private endpoints created. More info: https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_endpoint#attributes-reference"
}

output "resource_private_endpoints_application_security_group_association" {
  value       = module.avm-res-servicebus-namespace.resource_private_endpoints_application_security_group_association
  description = "The private endpoint application security group associations created"
}

output "resource_queues" {
  value       = module.avm-res-servicebus-namespace.resource_queues
  description = "The service bus queues created. More info: https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_endpoint_application_security_group_association#attributes-reference"
}

output "resource_queues_authorization_rules" {
  value       = module.avm-res-servicebus-namespace.resource_queues_authorization_rules
  description = "The service bus queues authorization rules created. More info: https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/servicebus_queue_authorization_rule#attributes-reference"
}

output "resource_role_assignments" {
  value       = module.avm-res-servicebus-namespace.resource_role_assignments
  description = "The role assignments created. More info: https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment#attributes-reference"
}

output "resource_topics" {
  value       = module.avm-res-servicebus-namespace.resource_topics
  description = "The service bus topics created. More info: https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/servicebus_topic.html#attributes-reference"
}

output "resource_topics_authorization_rules" {
  value       = module.avm-res-servicebus-namespace.resource_topics_authorization_rules
  description = "The service bus topics authorization rules created. More info: https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/servicebus_topic_authorization_rule#attributes-reference"
}

output "resource_topics_subscriptions" {
  value       = module.avm-res-servicebus-namespace.resource_topics_subscriptions
  description = "The service bus topic subscriptions created. More info: https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/servicebus_subscription#attributes-reference"
}
