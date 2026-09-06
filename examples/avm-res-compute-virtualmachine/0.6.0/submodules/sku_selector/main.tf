module "avm-res-compute-virtualmachine" {
  source            = "Azure/avm-res-compute-virtualmachine/azurerm"
  version           = "0.6.0"
  deployment_region = var.deployment_region
}
