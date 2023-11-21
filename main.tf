terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "jamie-code-challenge"
    storage_account_name = "jamietfstatebackend"
    container_name       = "tf-backend"
    key                  = "terraform.tfstate"
    use_msi              = true
    subscription_id      = "89b8d9b2-55b4-44a2-8575-dee6e8b72430"
    tenant_id            = "0d3746d1-321f-4d3c-880d-08da2a77adf2"
  }
}

provider "azurerm" {
  skip_provider_registration = "true"
  subscription_id = var.subscription_id
  # client_id       = var.client_id
  # client_secret   = var.client_secret
  tenant_id       = var.tenant_id
  use_msi         = true
  features {}
}