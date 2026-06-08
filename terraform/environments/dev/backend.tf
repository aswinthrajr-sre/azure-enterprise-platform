terraform {
  backend "azurerm" {
    resource_group_name  = "rg-tfstate-prod"
    storage_account_name = "staswinplatform001"
    container_name       = "tfstate"
    key                  = "dev.terraform.tfstate"
  }
}