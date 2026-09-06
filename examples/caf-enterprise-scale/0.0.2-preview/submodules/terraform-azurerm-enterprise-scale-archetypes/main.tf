module "caf-enterprise-scale" {
  source                 = "Azure/caf-enterprise-scale/azurerm"
  version                = "0.0.2-preview"
  archetype_id           = var.archetype_id
  archetype_library_path = var.archetype_library_path
  archetype_parameters   = var.archetype_parameters
  default_location       = var.default_location
  root_id                = var.root_id
  scope_id               = var.scope_id
}
