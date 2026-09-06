module "avm-res-avs-privatecloud" {
  source               = "Azure/avm-res-avs-privatecloud/azurerm"
  version              = "0.2.0"
  total_quota_required = var.total_quota_required
}
