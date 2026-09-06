module "aks" {
  source         = "Azure/aks/azurerm"
  version        = "1.0.0"
  public_ssh_key = var.public_ssh_key
}
