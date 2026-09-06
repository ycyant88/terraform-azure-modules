module "avm-res-containerregistry-registry" {
  source                  = "Azure/avm-res-containerregistry-registry/azurerm"
  version                 = "0.7.0"
  actions                 = var.actions
  container_registry_name = var.container_registry_name
  description             = var.description
  name                    = var.name
  registry_tokens         = var.registry_tokens
  resource_group_name     = var.resource_group_name
}
