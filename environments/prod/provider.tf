terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.22.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "State-Management"
    storage_account_name = "statemanagement434"
    container_name       = "statefile"
    key                  = "prod.terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
  subscription_id = "cba3453a-ff1f-4f51-b6f6-5a1149843776"
}
