resource "azurerm_virtual_machine" "virtual_machine_good" {
  name                  = "my-vm"
  location              = "location"
  resource_group_name   = "group_name"
  network_interface_ids = ["1234567"]
  vm_size               = "Standard_DS1_v2"

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
  storage_os_disk {
    name              = "myosdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "hostname"
    admin_username = "testadmin"
    admin_password = "Password1234!"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
  tags = {
    environment = "staging"
    yor_trace   = "2ed4e5e7-e519-464c-8a33-c1c3524d59a3"
  }
}

resource "azurerm_virtual_machine" "virtual_machine_bad" {
  name                  = "my-vm"
  location              = "location"
  resource_group_name   = "group_name"
  network_interface_ids = ["1234567"]
  vm_size               = "Standard_DS1_v2"

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
  storage_os_disk {
    name          = "myosdisk1"
    caching       = "ReadWrite"
    create_option = "FromImage"
    vhd_uri       = "uri://foo"
  }
  os_profile {
    computer_name  = "hostname"
    admin_username = "testadmin"
    admin_password = "Password1234!"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
  tags = {
    environment = "staging"
    yor_trace   = "b14754c5-f9a7-4024-b68b-c120b7a424d1"
  }
}