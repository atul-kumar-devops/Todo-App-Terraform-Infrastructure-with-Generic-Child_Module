resource_group = {
  "rg1" = {
    resource_group_name = "prod-rg-01"
    location            = "centralus"
  }
  # "rg2" = {
  #   resource_group_name = "prod-rg-02"
  #   location            = "centralus"
  #   tags = {
  #     managed_by  = "Terrform"
  #     environment = "dev"
  #   }
  # }
}

storage_account = {
  "stg1" = {
    storage_account_name     = "prodgenericstgtodoapp001"
    resource_group_name      = "prod-rg-01"
    location                 = "centralus"
    account_replication_type = "LRS"
    account_tier             = "Standard"
  }
}

virtual_network = {
  "vnet1" = {
    virtual_network_name = "prod-vnet-01"
    resource_group_name  = "prod-rg-01"
    location             = "centralus"
    address_space        = ["10.0.0.0/16"]
    dns_servers          = ["10.10.0.4", "10.10.0.5"]
  }
}
