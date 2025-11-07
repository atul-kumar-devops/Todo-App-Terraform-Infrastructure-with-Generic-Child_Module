data "azurerm_subnet" "data_subnet" {
  for_each = var.linux_vms

  name                 = each.value.subnet_name
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}

data "azurerm_public_ip" "data_pip" {
  for_each = var.linux_vms

  name                = each.value.pip_name
  resource_group_name = each.value.resource_group_name
}

data "azurerm_key_vault" "data_kv" {
  for_each = var.linux_vms

  name                = each.value.key_vault_name
  resource_group_name = each.value.resource_group_name
}

# data "azurerm_key_vault_secrets" "data_Kv_secrets" {
#   key_vault_id = data.azurerm_key_vault.data_kv[each.key].id
# }

# data "azurerm_key_vault_secret" "data_kv_secret" {
#   for_each = var.linux_vms

#     # name = toset(data.azurerm_key_vault_secrets.data_Kv_secrets.)
#     key_vault_id = data.azurerm_key_vault.data_kv[each.key].id
# }

data "azurerm_key_vault_secret" "data_kv_secret_vm_username" {
  for_each = var.linux_vms

  name         = "vm-username"
  key_vault_id = data.azurerm_key_vault.data_kv[each.key].id
}

data "azurerm_key_vault_secret" "data_kv_secret_vm_user_password" {
  for_each = var.linux_vms

  name         = "vm-password"
  key_vault_id = data.azurerm_key_vault.data_kv[each.key].id
}

data "azurerm_network_security_group" "data_nsg" {
  for_each = var.linux_vms

  name                = each.value.nsg_name
  resource_group_name = each.value.resource_group_name
}
