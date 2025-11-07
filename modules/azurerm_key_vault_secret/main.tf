resource "azurerm_key_vault_secret" "child_kv_secret" {
  for_each = var.kv_secrets

  name         = each.value.kv_secret_name
  value        = each.value.kv_secret_value
  key_vault_id = data.azurerm_key_vault.data_kv[each.key].id
  tags         = each.value.tags
}
