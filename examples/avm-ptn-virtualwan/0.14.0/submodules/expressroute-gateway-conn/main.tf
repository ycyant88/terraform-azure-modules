module "avm-ptn-virtualwan" {
  source                 = "Azure/avm-ptn-virtualwan/azurerm"
  version                = "0.14.0"
  er_circuit_connections = var.er_circuit_connections
}
