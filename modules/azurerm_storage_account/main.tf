resource "azurerm_storage_account" "child_stg" {
  for_each = var.storage_account

  name                     = each.value.storage_account_name
  location                 = each.value.location
  resource_group_name      = each.value.resource_group_name
  account_replication_type = each.value.account_replication_type
  account_tier             = each.value.account_tier
  account_kind             = each.value.account_kind

  #Optional arguements
  access_tier = try(each.value.access_tier, null)


  dynamic "custom_domain" {
    for_each = each.value.custom_domain
    content {
      name          = custom_domain.value.name
      use_subdomain = custom_domain.value.use_subdomain
    }
  }

  dynamic "network_rules" {
    # for_each = each.value.network_rules != null ? [each.value.network_rules] : []
    for_each = each.value.network_rules
    content {
      default_action = network_rules.value.default_action
      bypass         = network_rules.value.bypass
      ip_rules       = network_rules.value.ip_rules
    }
  }

  dynamic "identity" {
    for_each = each.value.identity
    content {
      type         = identity.value.type
      identity_ids = identity.value.identity_ids
    }
  }

  tags = each.value.tags
}
