output "arc_settings" {
  value       = module.avm-res-azurestackhci-cluster.arc_settings
  description = "Arc settings instance after HCI connected."
}

output "arcbridge" {
  value       = module.avm-res-azurestackhci-cluster.arcbridge
  description = "Arc resource bridge instance after HCI connected."
}

output "cluster" {
  value       = module.avm-res-azurestackhci-cluster.cluster
  description = "HCI Cluster instance"
}

output "customlocation" {
  value       = module.avm-res-azurestackhci-cluster.customlocation
  description = "Custom location instance after HCI connected."
}

output "keyvault" {
  value       = module.avm-res-azurestackhci-cluster.keyvault
  description = "Keyvault instance that stores deployment secrets."
}

output "resource_id" {
  value       = module.avm-res-azurestackhci-cluster.resource_id
  description = "This is the full output for the resource."
}

output "user_storages" {
  value       = module.avm-res-azurestackhci-cluster.user_storages
  description = "User storage instances after HCI connected."
}

output "v_switch_name" {
  value       = module.avm-res-azurestackhci-cluster.v_switch_name
  description = "The name of the virtual switch that is used by the network."
}
