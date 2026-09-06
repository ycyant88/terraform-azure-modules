module "avm-res-kusto-cluster" {
  source              = "Azure/avm-res-kusto-cluster/azurerm"
  version             = "0.1.0"
  cluster_name        = var.cluster_name
  name                = var.name
  principal_id        = var.principal_id
  principal_type      = var.principal_type
  resource_group_name = var.resource_group_name
  role                = var.role
  tenant_id           = var.tenant_id
}
