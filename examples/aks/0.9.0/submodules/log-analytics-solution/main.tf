module "aks" {
  source                = "Azure/aks/azurerm"
  version               = "0.9.0"
  location              = var.location
  resource_group_name   = var.resource_group_name
  workspace_name        = var.workspace_name
  workspace_resource_id = var.workspace_resource_id
}
