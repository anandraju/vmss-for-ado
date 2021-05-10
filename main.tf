provider "azurerm" {
  #version = "=2.0.0"
  features {}
}

resource "azurerm_resource_group" "devops_vmss_ado" {
  name     = "devops_vmss_ado"
  location = var.location
}

resource "azurerm_resource_group" "devops_vmss" {
  name     = "devops_vmss"
  location = "East US"
}

resource "azurerm_image" "search" {
  name = "testesttest"
  location = "East US"
  resource_group_name = azurerm_resource_group.devops_vmss.name
}
# resource "image" "foo" {
#   # (resource arguments)
# }
