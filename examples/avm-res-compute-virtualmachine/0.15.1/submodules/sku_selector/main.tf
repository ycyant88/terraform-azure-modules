module "avm-res-compute-virtualmachine" {
  source            = "Azure/avm-res-compute-virtualmachine/azurerm"
  version           = "0.15.1"
  deployment_region = var.deployment_region
}
