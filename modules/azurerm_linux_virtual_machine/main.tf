resource "azurerm_network_interface" "child_nic" {
  for_each = var.linux_vms

  name                = each.value.nic_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.data_subnet[each.key].id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = data.azurerm_public_ip.data_pip[each.key].id
  }
}

resource "azurerm_linux_virtual_machine" "child_linux_vm" {
  for_each = var.linux_vms

  name                            = each.value.linux_vm_name
  resource_group_name             = each.value.resource_group_name
  location                        = each.value.location
  size                            = each.value.size
  disable_password_authentication = false
  admin_username                  = data.azurerm_key_vault_secret.data_kv_secret_vm_username[each.key].value
  admin_password                  = data.azurerm_key_vault_secret.data_kv_secret_vm_user_password[each.key].value
  network_interface_ids           = [azurerm_network_interface.child_nic[each.key].id, ]
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = each.value.source_image_reference.publisher
    offer     = each.value.source_image_reference.offer
    sku       = each.value.source_image_reference.sku
    version   = each.value.source_image_reference.version
  }
  tags = each.value.tags
}

resource "azurerm_network_interface_security_group_association" "child_nic_nsg_association" {
  for_each = var.linux_vms

  network_interface_id      = azurerm_network_interface.child_nic[each.key].id
  network_security_group_id = data.azurerm_network_security_group.data_nsg[each.key].id
}
