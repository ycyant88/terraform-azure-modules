module "aks" {
  source         = "Azure/aks/azurerm"
  version        = "4.11.0"
  public_ssh_key = var.public_ssh_key
}
