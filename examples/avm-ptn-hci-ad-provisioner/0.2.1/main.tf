module "avm-ptn-hci-ad-provisioner" {
  source                   = "Azure/avm-ptn-hci-ad-provisioner/azurerm"
  version                  = "0.2.1"
  adou_path                = var.adou_path
  authentication_method    = var.authentication_method
  dc_ip                    = var.dc_ip
  dc_port                  = var.dc_port
  deployment_user          = var.deployment_user
  deployment_user_password = var.deployment_user_password
  destory_adou             = var.destory_adou
  domain_admin_password    = var.domain_admin_password
  domain_admin_user        = var.domain_admin_user
  domain_fqdn              = var.domain_fqdn
  enable_telemetry         = var.enable_telemetry
  resource_group_name      = var.resource_group_name
}
