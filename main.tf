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
  subscription_id            = var.subscription_id
  # client_id                = var.client_id
  # client_secret            = var.client_secret
  tenant_id                  = var.tenant_id
  use_msi                    = true
  features {}
}

resource "azurerm_user_assigned_identity" "aks" {
  name                = "uai-aks"
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_kubernetes_cluster" "jamie_aks_cluster" {
  name                = var.aks_cluster_name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = "jamieaksdns"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }

  identity {
    type = "UserAssigned"
    identity_ids = [azurerm_user_assigned_identity.aks.id]
  }

  # identity {
  #   type = "SystemAssigned"
  # }

  tags = {
    Environment = "code_challenge"
  }
}