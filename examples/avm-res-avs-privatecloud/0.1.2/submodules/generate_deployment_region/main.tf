module "avm-res-avs-privatecloud" {
  source               = "Azure/avm-res-avs-privatecloud/azurerm"
  version              = "0.1.2"
  total_quota_required = var.total_quota_required
}
