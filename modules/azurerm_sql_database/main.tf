resource "azurerm_mssql_database" "child_sql_database" {
  for_each = var.sql_database

  name         = each.value.sql_database_name
  server_id    = each.value.server_id
  collation    = each.value.collation
  license_type = each.value.license_type
  max_size_gb  = each.value.max_size_gb
  sku_name     = each.value.sku_name
  enclave_type = each.value.enclave_type
  tags         = each.value.tags
  # tags = var.tags
}
