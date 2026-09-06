module "avm-res-avs-privatecloud" {
  source                            = "Azure/avm-res-avs-privatecloud/azurerm"
  version                           = "0.11.0"
  management_cluster_quota_required = var.management_cluster_quota_required
  private_cloud_generation          = var.private_cloud_generation
  secondary_cluster_quota_required  = var.secondary_cluster_quota_required
  test_regions                      = var.test_regions
}
