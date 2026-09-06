module "avm-ptn-hci-server-provisioner" {
  source                   = "Azure/avm-ptn-hci-server-provisioner/azurerm"
  version                  = "0.1.0"
  authentication_method    = var.authentication_method
  enable_telemetry         = var.enable_telemetry
  expand_c                 = var.expand_c
  local_admin_password     = var.local_admin_password
  local_admin_user         = var.local_admin_user
  location                 = var.location
  name                     = var.name
  resource_group_name      = var.resource_group_name
  server_ip                = var.server_ip
  service_principal_id     = var.service_principal_id
  service_principal_secret = var.service_principal_secret
  subscription_id          = var.subscription_id
  tenant                   = var.tenant
  winrm_port               = var.winrm_port
}
