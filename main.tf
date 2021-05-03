terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.57.0"
    }
  }
}
terraform {
  backend "azurerm" {
    resource_group_name  = "rg-AksLab"
    storage_account_name = "tfstateaks17972"
    container_name       = "ctfstate30864"
    key                  = "7PpaW0/ksQQ7ZVW8y4LgI3qC6fb6ggXPitejmD2nP5z0oKLypp7KAGv/R17gVrweiwcCYQp0eY9Icr9OGE4KoA=="
  }
}
provider "azurerm" {
 subscription_id = var.subscription_id 
   features {}
}

resource "azurerm_resource_group" "k8s" {
  name     = var.resourcename
  location = var.location
}

resource "azurerm_kubernetes_cluster" "k8s" {
  name                = var.clustername
  location            = azurerm_resource_group.k8s.location
  resource_group_name = azurerm_resource_group.k8s.name
  dns_prefix          = var.dnspreffix

  default_node_pool {
    name       = "default"
    node_count = var.agentnode
    vm_size    = "Standard_A2_v2"
    
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Production"
  }
}
resource "azurerm_kubernetes_cluster_node_pool" "nodepool" {
  name                  = "linuxnodes"
  kubernetes_cluster_id = azurerm_kubernetes_cluster.k8s.id
  vm_size               = var.size
  node_count            = 2
  priority              = "Spot"

  tags = {
    Environment = "Production"
  }
}