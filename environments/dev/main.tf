locals {
  common_tags = {
    "ManagedBy"   = "Terraform"
    "Owner"       = "TodoAppTeam"
    "Environment" = "dev"
  }
}



# module "rg" {
#   source              = "../../modules/azurerm_resource_group"
#   resource_group_name = "dev-rg-01"
#   location            = "centralus"
#   tags                = local.common_tags
# }

# module "stg" {
#   source               = "../../modules/azurerm_storage_account"
#   depends_on           = [module.rg]
#   storage_account_name = "devstgtodoapp001"
#   resource_group_name  = "dev-rg-01"
#   location             = "centralus"
#   tags                 = local.common_tags
# }

# module "sql_server" {
#   source              = "../../modules/azurerm_sql_server"
#   depends_on          = [module.rg]
#   sql_server_name     = "todoapp-sql-server01"
#   resource_group_name = "dev-rg-01"
#   location            = "centralus"
#   admin_username      = "devdbprivilgeuser"
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
#   resource_group_name = "dev-rg-01"
#   location            = "centralus"
#   tags                = local.common_tags
# }

# module "aks" {
#   source              = "../../modules/azurerm_kubernetes_cluster"
#   depends_on          = [module.rg]
#   aks_name            = "aks-dev-todoapp"
#   resource_group_name = "dev-rg-01"
#   location            = "centralus"
#   dns_prefix          = "aks-dev-todoapp"
#   node_count          = 1
#   tags                = local.common_tags
# }

# module "pip" {
#   source              = "../../modules/azurerm_public_ip"
#   depends_on          = [module.rg]
#   pip_name            = "dev-pip-todoapp"
#   resource_group_name = "dev-rg-01"
#   location            = "centralus"
#   sku                 = "Basic"
#   tags                = local.common_tags
# }
