data "azurerm_resource_group" "image" {
  name = "devops_rg"
}

data "azurerm_image" "image" {
  name                = "Devops_VM-image-20210511173856"
  resource_group_name = data.azurerm_resource_group.image.name
  #id = azurerm_image.image.id
}

resource "azurerm_linux_virtual_machine_scale_set" "buildagent-vmss" {
  name                = "buildagent-vmss"
  resource_group_name = azurerm_resource_group.devops_vmss_ado.name
  location            = azurerm_resource_group.devops_vmss_ado.location
  sku                 = "Standard_F2"
  instances           = 1
  source_image_id     = data.azurerm_image.image.id

  overprovision          = false
  single_placement_group = false

  admin_username                  = "testadmin"
  admin_password                  = var.admin_password
  disable_password_authentication = false


  os_disk {
    storage_account_type = "Standard_LRS"
    caching              = "ReadWrite"
  }

  network_interface {
    name    = "${azurerm_resource_group.devops_vmss_ado.name}-vmss-nic"
    primary = true

    ip_configuration {
      name      = "${azurerm_resource_group.devops_vmss_ado.name}-ip-config"
      primary   = true
      subnet_id = azurerm_subnet.Deveops_subnet.id
    }
  }
}
