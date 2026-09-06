module "avm-ptn-virtualwan" {
  source                 = "Azure/avm-ptn-virtualwan/azurerm"
  version                = "0.9.0"
  er_circuit_connections = var.er_circuit_connections
}
