resource "azurerm_resource_group" "child_rg" {
  for_each = var.resource_group

  name     = each.value.resource_group_name
  location = each.value.location
  tags     = each.value.tags

  # tags = var.tags
}
