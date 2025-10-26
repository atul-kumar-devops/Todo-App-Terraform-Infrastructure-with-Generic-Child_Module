locals {
  common_tags = {
    "ManagedBy"   = "Terraform"
    "Owner"       = "TodoAppTeam"
    "Environment" = "prod"
  }
}

module "rg" {
  source         = "../../modules/azurerm_resource_group"
  resource_group = var.resource_group
}

module "storage_account" {
  depends_on      = [module.rg]
  source          = "../../modules/azurerm_storage_account"
  storage_account = var.storage_account
}

module "azure_container_registry" {
  depends_on = [module.rg]
  source     = "../../modules/azurerm_container_registry"
  acr        = var.azure_container_registry

}

module "aks_cluster" {
  depends_on  = [module.rg]
  source      = "../../modules/azurerm_kubernetes_cluster"
  aks_cluster = var.azure_kuberetes_cluster
}

# module "sql_server" {
#   depends_on = [ module.rg ]
#   source = "../../modules/azurerm_sql_server"
#   sql_server = var.sql_server
# }

# module "sql_database" {
#   depends_on = [ module.rg ]
#   source = "../../modules/azurerm_sql_database"
#   sql_database = var.sql_database
# }



# module "rg" {
#   source              = "../../modules/azurerm_resource_group"
#   resource_group_name = "prod-rg-01"
#   location            = "centralus"
#   tags                = local.common_tags
# }

# # module "stg" {
# #   source               = "../../modules/azurerm_storage_account"
# #   depends_on           = [module.rg]
# #   storage_account_name = "prodstgtodoapp001"
# #   resource_group_name  = "prod-rg-01"
# #   location             = "centralus"
# #   tags                 = local.common_tags
# # }

# module "sql_server" {
#   source              = "../../modules/azurerm_sql_server"
#   depends_on          = [module.rg]
#   sql_server_name     = "todoapp-sql-server01"
#   resource_group_name = "prod-rg-01"
#   location            = "centralus"
#   admin_username      = "proddbprivilgeuser"
#   admin_password      = "Adminuser@123"
#   tags                = local.common_tags
# }

# module "sql_database" {
#   source            = "../../modules/azurerm_sql_database"
#   depends_on        = [module.sql_server]
#   sql_database_name = "sql-database-todoapp"
#   server_id         = module.sql_server.server_id
#   max_size_gb       = "2"
#   tags              = local.common_tags
# }

# module "acr" {
#   source              = "../../modules/azurerm_container_registry"
#   depends_on          = [module.rg]
#   acr_name            = "todoappacr001"
#   resource_group_name = "prod-rg-01"
#   location            = "centralus"
#   tags                = local.common_tags
# }

# module "aks" {
#   source              = "../../modules/azurerm_kubernetes_cluster"
#   depends_on          = [module.rg]
#   aks_name            = "aks-prod-todoapp"
#   resource_group_name = "prod-rg-01"
#   location            = "centralus"
#   dns_prefix          = "aks-prod-todoapp"
#   node_count          = 1
#   tags                = local.common_tags
# }

# module "pip" {
#   source              = "../../modules/azurerm_public_ip"
#   depends_on          = [module.rg]
#   pip_name            = "prod-pip-todoapp"
#   resource_group_name = "prod-rg-01"
#   location            = "centralus"
#   sku                 = "Basic"
#   tags                = local.common_tags
# }
