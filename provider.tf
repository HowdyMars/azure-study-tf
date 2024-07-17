#######################################
#    ___             _    _           #
#   | _ \_ _ _____ _(_)__| |___ _ _   #
#   |  _| '_/ _ \ V | / _` / -_| '_|  #
#   |_| |_| \___/\_/|_\__,_\___|_|    #
#                                     #
#######################################

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.0.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "2.53.1"
    }
  }
  backend "azurerm" {
    resource_group_name  = "tfstate"
    storage_account_name = "howdytfstate"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}
