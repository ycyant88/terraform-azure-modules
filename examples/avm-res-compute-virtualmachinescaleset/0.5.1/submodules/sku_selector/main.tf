module "avm-res-compute-virtualmachinescaleset" {
  source            = "Azure/avm-res-compute-virtualmachinescaleset/azurerm"
  version           = "0.5.1"
  deployment_region = var.deployment_region
}
