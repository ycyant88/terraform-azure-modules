module "avm-res-compute-virtualmachinescaleset" {
  source                = "Azure/avm-res-compute-virtualmachinescaleset/azurerm"
  version               = "0.11.1"
  deployment_region     = var.deployment_region
  hibernation_supported = var.hibernation_supported
}
