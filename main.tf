provider "azurerm" {
  #version = "=2.0.0"
  features {}
}

resource "azurerm_resource_group" "devops_vmss_ado" {
  name     = "devops_vmss_ado"
  location = var.location
}

resource "azurerm_resource_group" "devops_rg" {
  name     = "devops_rg"
  location = var.location
}

resource "azurerm_image" "image" {
  name     = "Devops_VM-image-20210511173856"
  location = "East US"
  resource_group_name = azurerm_resource_group.devops_rg.name
  source_virtual_machine_id = "/subscriptions/5a8d2bcf-85f4-4625-a08e-162fcb039c1a/resourceGroups/devops_rg/providers/Microsoft.Compute/virtualMachines/Devops_VM"
  
}
