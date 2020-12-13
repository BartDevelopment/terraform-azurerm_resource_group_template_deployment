resource "azurerm_resource_group_template_deployment" "template" {
  for_each            = var.templates
  name                = each.value.name
  resource_group_name = var.resource_group_name
  deployment_mode     = each.value.deployment_mode
  template_content    = each.value.template_content
  parameters_content  = each.value.parameters_content

  tags = var.tags
}
