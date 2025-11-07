terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.22.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "State-Management"
    storage_account_name = "statemanagement244"
    container_name       = "statefile"
    key                  = "prod.terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
  subscription_id = "1d3588c8-af2c-442c-bdc3-7fc3b65594b9"
}
