output "a_record_outputs" {
  value       = module.avm-res-network-dnszone.a_record_outputs
  description = "The a record output"
}

output "aaaa_record_outputs" {
  value       = module.avm-res-network-dnszone.aaaa_record_outputs
  description = "The aaaa record output"
}

output "caa_record_outputs" {
  value       = module.avm-res-network-dnszone.caa_record_outputs
  description = "The caa record output"
}

output "cname_record_outputs" {
  value       = module.avm-res-network-dnszone.cname_record_outputs
  description = "The cname record output"
}

output "max_number_of_record_sets" {
  value       = module.avm-res-network-dnszone.max_number_of_record_sets
  description = "Maximum number of Records in Zone output"
}

output "mx_record_outputs" {
  value       = module.avm-res-network-dnszone.mx_record_outputs
  description = "The mx record output"
}

output "name_servers" {
  value       = module.avm-res-network-dnszone.name_servers
  description = "List of values that make up NS Record for Zone"
}

output "ns_record_outputs" {
  value       = module.avm-res-network-dnszone.ns_record_outputs
  description = "The ns record output"
}

output "number_of_record_sets" {
  value       = module.avm-res-network-dnszone.number_of_record_sets
  description = "Number of records in DNS Zone"
}

output "ptr_record_outputs" {
  value       = module.avm-res-network-dnszone.ptr_record_outputs
  description = "The ptr record output"
}

output "resource_id" {
  value       = module.avm-res-network-dnszone.resource_id
  description = "Id of dns zone"
}

output "srv_record_outputs" {
  value       = module.avm-res-network-dnszone.srv_record_outputs
  description = "The srv record output"
}

output "txt_record_outputs" {
  value       = module.avm-res-network-dnszone.txt_record_outputs
  description = "The txt record output"
}
