output "resource_id" {
  value       = module.avm-res-network-dnsresolver.resource_id
  description = "Usage: To get the id of the link, use the same keys you used in the virtual_networks map.\nmodule.<module_name>.resource_id[\"<vnet_key>\"]\n"
}
