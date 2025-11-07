resource "azurerm_virtual_network" "child_virtual_network" {
  for_each = var.virtual_networks

  name                = each.value.virtual_network_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  address_space       = each.value.address_space //Exactly one of address_space or ip_address_pool must be specified.

  // Optional Arguements
  dns_servers = each.value.dns_servers

  dynamic "ddos_protection_plan" {
    for_each = each.value.ddos_protection_plan
    content {
      id     = ddos_protection_plan.value.id
      enable = ddos_protection_plan.value.enable
    }
  }

  dynamic "encryption" {
    for_each = each.value.encryption_defined != null ? each.value.encryption_defined : {}
    content {
      enforcement = encryption.value.encryption_defined
    }
  }

  tags = each.value.tags

}
