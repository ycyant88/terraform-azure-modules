// This is a placeholder for the s3 remote backend configuration.
// Add your own custom values below.
// https://developer.hashicorp.com/terraform/language/backend/azurerm

# terraform {
#   backend "azurerm" {
#     use_oidc                         = true
#     oidc_azure_service_connection_id = "00000000-0000-0000-0000-000000000000"
#     use_azuread_auth                 = true
#     tenant_id                        = "00000000-0000-0000-0000-000000000000"
#     client_id                        = "00000000-0000-0000-0000-000000000000"
#     storage_account_name             = "abcd1234"
#     container_name                   = "tfstate"
#     key                              = "prod.terraform.tfstate"
#   }
# }
