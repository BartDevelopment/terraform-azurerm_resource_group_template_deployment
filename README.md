# terraform-azurerm_resource_group_template_deployment
This module contains usage of ARM Template in Microsoft Azure. One can deploy multiple ARM templates using one module.


# Example code

```sh
module "arm_template" {
  source = "https://github.com/BartoszDopke/terraform-azurerm_resource_group_template_deployment"

  resource_group_name = module.resource_group.name

  templates = {
    template1 = {
      name             = "template1"
      deployment_mode  = "Incremental"
      template_content = file("templates/CreateResourceHealthAlert.json")
      parameters_content = jsonencode({
        "actionGroups_name" = {
          value = "action-group-01"
        }
        "activityLogAlerts_description" = {
          value = "parameters test"
        }
      })
    },
    template2 = {
      name             = "template2"
      deployment_mode  = "Incremental"
      template_content = file("templates/CreateServiceHealthAlert.json")
      parameters_content = jsonencode({
        "actionGroups_name" = {
          value = "action-group-01"
        }
        "activityLogAlerts_description" = {
          value = "parameters test"
        }
      })
    }
  }

  tags = var.tags
}
```
