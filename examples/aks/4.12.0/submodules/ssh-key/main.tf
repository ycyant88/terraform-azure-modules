module "aks" {
  source         = "Azure/aks/azurerm"
  version        = "4.12.0"
  public_ssh_key = var.public_ssh_key
}
