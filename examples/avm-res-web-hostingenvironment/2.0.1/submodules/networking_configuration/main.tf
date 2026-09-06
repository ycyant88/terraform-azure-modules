module "avm-res-web-hostingenvironment" {
  source                                 = "Azure/avm-res-web-hostingenvironment/azurerm"
  version                                = "2.0.1"
  allow_new_private_endpoint_connections = var.allow_new_private_endpoint_connections
  ftp_enabled                            = var.ftp_enabled
  hosting_environment_resource_id        = var.hosting_environment_resource_id
  remote_debug_enabled                   = var.remote_debug_enabled
}
