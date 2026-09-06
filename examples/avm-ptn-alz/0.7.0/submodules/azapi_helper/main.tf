module "avm-ptn-alz" {
  source                  = "Azure/avm-ptn-alz/azurerm"
  version                 = "0.7.0"
  body                    = var.body
  identity                = var.identity
  ignore_missing_property = var.ignore_missing_property
  location                = var.location
  name                    = var.name
  parent_id               = var.parent_id
  replace_triggered_by    = var.replace_triggered_by
  response_export_values  = var.response_export_values
  timeouts                = var.timeouts
  type                    = var.type
}
