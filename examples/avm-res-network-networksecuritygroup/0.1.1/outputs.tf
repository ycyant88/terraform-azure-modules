output "nsg_resource" {
  value       = module.avm-res-network-networksecuritygroup.nsg_resource
  description = "The Azure Network Security Group resource"
}
