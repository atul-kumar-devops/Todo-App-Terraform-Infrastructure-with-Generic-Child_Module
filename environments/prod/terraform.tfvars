resource_group = {
  "rg" = {
    resource_group_name = "prod-rg-01"
    location            = "centralus"
  }
}

storage_account = {
  "stg" = {
    storage_account_name     = "storageaccount34548"
    location                 = "centralus"
    resource_group_name      = "prod-rg-01"
    account_replication_type = "LRS"
    account_tier             = "Standard"
  }
}

azure_container_registry = {
  "acr" = {
    acr_name            = "todoappacr001"
    resource_group_name = "prod-rg-01"
    location            = "centralus"
    sku                 = "Premium"
    admin_enabled       = false
  }
}

azure_kuberetes_cluster = {
  "aks_cluster_01" = {
    aks_name            = "aks-prod-todoapp"
    resource_group_name = "prod-rg-01"
    location            = "centralus"
    dns_prefix          = "aks-prod-todoapp"
    default_node_pool = {
      name       = "default"
      node_count = 1
      vm_size    = "Standard_DS2_v2"
    }
    identity = {
      type = "SystemAssigned"
    }
  }
}

# sql_server = {
#   "sql_server_01" = {
#     sql_server_name              = "todoapp-sql-server01"
#     resource_group_name          = "prod-rg-01"
#     location                     = "centralus"
#     version                      = "12.0"
#     administrator_login          = "proddbprivilgeuser"
#     administrator_login_password = "Adminuser@123"
#     minimum_tls_version          = "1.2"
#   }
# }

# sql_database = {
#   "sql_database" = {
#     sql_database_name = "sql-database-todoapp"
#     server_id         = module.sql_server.server_id
#     collation         = "SQL_Latin1_General_CP1_CI_AS"
#     license_type      = "LicenseIncluded"
#     max_size_gb       = "2"
#     sku_name          = "S0"
#     enclave_type      = "VBS"
#   }
# }
