resource "azurerm_resource_group" "child_rg" {
  for_each = var.resource_group

  name     = each.value.resource_group_name // Resource Group Name
  location = each.value.location            // Resource Group Location
  tags     = each.value.tags                // Tags
}
