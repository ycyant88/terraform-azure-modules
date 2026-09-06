module "lz-vending" {
  source               = "Azure/lz-vending/azurerm"
  version              = "4.1.0"
  budget_amount        = var.budget_amount
  budget_name          = var.budget_name
  budget_notifications = var.budget_notifications
  budget_scope         = var.budget_scope
  budget_time_grain    = var.budget_time_grain
  budget_time_period   = var.budget_time_period
}
