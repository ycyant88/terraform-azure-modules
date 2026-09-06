module "aks" {
  source         = "Azure/aks/azurerm"
  version        = "0.9.0"
  public_ssh_key = var.public_ssh_key
}
