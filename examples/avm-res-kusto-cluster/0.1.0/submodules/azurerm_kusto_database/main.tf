module "avm-res-kusto-cluster" {
  source              = "Azure/avm-res-kusto-cluster/azurerm"
  version             = "0.1.0"
  cluster_name        = var.cluster_name
  hot_cache_period    = var.hot_cache_period
  location            = var.location
  name                = var.name
  resource_group_name = var.resource_group_name
  soft_delete_period  = var.soft_delete_period
}
