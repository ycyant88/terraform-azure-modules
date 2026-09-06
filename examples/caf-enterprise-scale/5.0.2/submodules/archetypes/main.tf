module "caf-enterprise-scale" {
  source                  = "Azure/caf-enterprise-scale/azurerm"
  version                 = "5.0.2"
  access_control          = var.access_control
  archetype_id            = var.archetype_id
  default_location        = var.default_location
  enforcement_mode        = var.enforcement_mode
  library_path            = var.library_path
  parameters              = var.parameters
  root_id                 = var.root_id
  scope_id                = var.scope_id
  template_file_variables = var.template_file_variables
}
