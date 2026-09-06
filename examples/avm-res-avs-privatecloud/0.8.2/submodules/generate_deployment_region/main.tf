module "avm-res-avs-privatecloud" {
  source                    = "Azure/avm-res-avs-privatecloud/azurerm"
  version                   = "0.8.2"
  total_av64_quota_required = var.total_av64_quota_required
  total_quota_required      = var.total_quota_required
}
