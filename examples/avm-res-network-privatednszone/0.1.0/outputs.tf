output "a_record_outputs" {
  value       = module.avm-res-network-privatednszone.a_record_outputs
  description = "The a record output"
}

output "aaaa_record_outputs" {
  value       = module.avm-res-network-privatednszone.aaaa_record_outputs
  description = "The aaaa record output"
}

output "cname_record_outputs" {
  value       = module.avm-res-network-privatednszone.cname_record_outputs
  description = "The cname record output"
}

output "mx_record_outputs" {
  value       = module.avm-res-network-privatednszone.mx_record_outputs
  description = "The mx record output"
}

output "private_dnz_zone_output" {
  value       = module.avm-res-network-privatednszone.private_dnz_zone_output
  description = "The private dns zone output"
}

output "ptr_record_outputs" {
  value       = module.avm-res-network-privatednszone.ptr_record_outputs
  description = "The ptr record output"
}

output "srv_record_outputs" {
  value       = module.avm-res-network-privatednszone.srv_record_outputs
  description = "The srv record output"
}

output "txt_record_outputs" {
  value       = module.avm-res-network-privatednszone.txt_record_outputs
  description = "The txt record output"
}

output "virtual_network_link_outputs" {
  value       = module.avm-res-network-privatednszone.virtual_network_link_outputs
  description = "The virtual network link output"
}
