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

virtual_networks = {
  "vnet1" = {
    virtual_network_name = "prod-vnet-01"
    resource_group_name  = "prod-rg-01"
    location             = "centralus"
    address_space        = ["10.0.0.0/16"]

  }
}

subnets = {
  "subnet1" = {
    subnet_name          = "prod-subnet-01"
    resource_group_name  = "prod-rg-01"
    virtual_network_name = "prod-vnet-01"
    address_prefixes     = ["10.0.0.0/24"]
  }
}

network_security_groups = {
  "nsg-01" = {
    nsg_name            = "prod-vm1-nsg"
    resource_group_name = "prod-rg-01"
    location            = "centralus"
    nsg_rules = [{
      security_rule_name         = "Allow-SSH"
      priority                   = 100
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "22"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
      },
      {
        security_rule_name         = "Allow-HTTP"
        priority                   = 101
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "80"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }
    ]
  }
}

public_ips = {
  "pip-01" = {
    pip_name            = "prod-pip-01"
    resource_group_name = "prod-rg-01"
    location            = "centralus"
    allocation_method   = "Static"
    sku                 = "Standard"
  }
}

key_vaults = {
  "key-vault-01" = {
    key_vault_name      = "prod-key-vault-01"
    resource_group_name = "prod-rg-01"
    location            = "centralus"
  }
}

kv_secrets = {
  "kv-username" = {
    kv_secret_name      = "vm-username"
    kv_secret_value     = "User-01"
    kv_name             = "prod-key-vault-01"
    resource_group_name = "prod-rg-01"
  }

  "kv-password" = {
    kv_secret_name      = "vm-password"
    kv_secret_value     = "Adminstrator@123"
    kv_name             = "prod-key-vault-01"
    resource_group_name = "prod-rg-01"
  }
}

linux_vms = {
  "vm1" = {
    nic_name             = "prod-vm1-nic"
    linux_vm_name        = "prod-linux-vm1"
    resource_group_name  = "prod-rg-01"
    virtual_network_name = "prod-vnet-01"
    location             = "centralus"
    size                 = "Standard_F2"
    source_image_reference = {
      publisher = "Canonical"
      offer     = "0001-com-ubuntu-server-jammy"
      sku       = "22_04-lts"
      version   = "latest"
    }
    subnet_name    = "prod-subnet-01"
    pip_name       = "prod-pip-01"
    nsg_name       = "prod-vm1-nsg"
    key_vault_name = "prod-key-vault-01"
  }
}


