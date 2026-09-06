<!-- BEGIN_TF_DOCS -->
# Azure Dev Center Catalog

This is the sub-module to deploy Dev Center Catalog

## Features

This module supports:

- Creates Dev Center Catalog

"Major version Zero (0.y.z) is for initial development. Anything MAY change at any time. The module SHOULD NOT be considered stable till at least it is major version one (1.0.0) or greater. Changes will always be via new versions being published and no changes will be made to existing published versions. For more details please go to <https://semver.org/>"

<!-- markdownlint-disable MD033 -->
## Requirements

The following requirements are needed by this module:

- <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) (~> 1.5)

- <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) (~> 3.71)

## Resources

The following resources are used by this module:

- [azurerm_dev_center_catalog.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dev_center_catalog) (resource)

<!-- markdownlint-disable MD013 -->
## Required Inputs

The following input variables are required:

### <a name="input_dev_center_catalog_dev_center_id"></a> [dev\_center\_catalog\_dev\_center\_id](#input\_dev\_center\_catalog\_dev\_center\_id)

Description: (Required) Specifies the Dev Center ID. Changing this forces a new resource to be created.

Type: `string`

### <a name="input_dev_center_catalog_name"></a> [dev\_center\_catalog\_name](#input\_dev\_center\_catalog\_name)

Description: (Required) Specifies the name of the Dev Center Catalog. Changing this forces a new resource to be created.

Type: `string`

### <a name="input_dev_center_catalog_resource_group_name"></a> [dev\_center\_catalog\_resource\_group\_name](#input\_dev\_center\_catalog\_resource\_group\_name)

Description: (Required) Specifies the name of the resource group in which the Dev Center Catalog should be created.

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_dev_center_catalog_adogit"></a> [dev\_center\_catalog\_adogit](#input\_dev\_center\_catalog\_adogit)

Description: A map describing the dev center catalog Azure DevOps Git repository.
- `branch` - (Required) The Git branch of the Dev Center Catalog.
- `path` - (Required) The folder where the catalog items can be found inside the repository.
- `key_vault_key_url` - (Required) A reference to the Key Vault secret containing a security token to authenticate to a Git repository.
- `uri` - (Required) The Git URI of the Dev Center Catalog.

Type:

```hcl
object({
    branch            = string
    path              = string
    key_vault_key_url = string
    uri               = string
  })
```

Default: `null`

### <a name="input_dev_center_catalog_github"></a> [dev\_center\_catalog\_github](#input\_dev\_center\_catalog\_github)

Description: A map describing the dev center catalog GitHub repository.
- `branch` - (Required) The Git branch of the Dev Center Catalog.
- `path` - (Required) The folder where the catalog items can be found inside the repository..
- `key_vault_key_url` - (Required) A reference to the Key Vault secret containing a security token to authenticate to a Git repository.
- `uri` - (Required) The Git URI of the Dev Center Catalog.

Type:

```hcl
object({
    branch            = string
    path              = string
    key_vault_key_url = string
    uri               = string
  })
```

Default: `null`

## Outputs

The following outputs are exported:

### <a name="output_resource_id"></a> [resource\_id](#output\_resource\_id)

Description: The ID of the Dev Center Catalog.

## Modules

No modules.

<!-- markdownlint-disable-next-line MD041 -->
## Data Collection

The software may collect information about you and your use of the software and send it to Microsoft. Microsoft may use this information to provide services and improve our products and services. You may turn off the telemetry as described in the repository. There are also some features in the software that may enable you and Microsoft to collect data from users of your applications. If you use these features, you must comply with applicable law, including providing appropriate notices to users of your applications together with a copy of Microsoft’s privacy statement. Our privacy statement is located at <https://go.microsoft.com/fwlink/?LinkID=824704>. You can learn more about data collection and use in the help documentation and our privacy statement. Your use of the software operates as your consent to these practices.
<!-- END_TF_DOCS -->
