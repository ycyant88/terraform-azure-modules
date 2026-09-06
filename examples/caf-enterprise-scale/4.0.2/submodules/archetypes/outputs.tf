output "configuration" {
  value       = module.caf-enterprise-scale.configuration
  description = "Returns the archetype configuration data used to generate all resources needed to complete deployment of the Enterprise-scale Landing Zones, as per the specified archetype_id."
}
