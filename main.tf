resource "azurerm_virtual_machine" "vm_subscription1" {
  count                 = var.vm_count
  provider              = azurerm.subscription1
  name                  = "${var.vm_name}-subscription1-${count.index}"
  location              = var.region
  resource_group_name   = var.resource_group_name_subscription1
  network_interface_ids = [azurerm_network_interface.nic_subscription1[count.index].id]
  vm_size               = var.vm_size

  storage_image_reference {
    publisher = "RedHat"
    offer     = "RHEL"
    sku       = "9"
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
    admin_username = var.vm_admin_username
  }

  os_profile_linux_config {
    disable_password_authentication = false
    ssh_keys {
      path     = "/home/${var.vm_admin_username}/.ssh/authorized_keys"
      key_data = var.vm_ssh_key
    }
  }
}

resource "azurerm_network_interface" "nic_subscription1" {
  count               = var.vm_count
  provider            = azurerm.subscription1
  name                = "nic-subscription1-${count.index}"
  location            = var.region
  resource_group_name = var.resource_group_name_subscription1

  ip_configuration {
    name                          = var.subnet_name_subscription1
    subnet_id                     = var.subnet_id_subscription1
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_network_interface_security_group_association" "nsg_association_subscription1" {
  count                    = var.vm_count
  network_interface_id     = azurerm_network_interface.nic_subscription1[count.index].id
  network_security_group_id = azurerm_network_security_group.nsg_subscription1.id
}

resource "azurerm_network_security_group" "nsg_subscription1" {
  provider            = azurerm.subscription1
  name                = "nsg-subscription1"
  location            = var.region
  resource_group_name = var.resource_group_name_subscription1

  security_rule {
    name                       = "Allow-SSH-Inbound"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_virtual_machine" "vm_subscription2" {
  count                 = var.vm_count
  provider              = azurerm.subscription2
  name                  = "${var.vm_name}-subscription2-${count.index}"
  location              = var.region
  resource_group_name   = var.resource_group_name_subscription2
  network_interface_ids = [azurerm_network_interface.nic_subscription2[count.index].id]
  vm_size               = var.vm_size

  storage_image_reference {
    publisher = "RedHat"
    offer     = "RHEL"
    sku       = "9"
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
    admin_username = var.vm_admin_username
  }

  os_profile_linux_config {
    disable_password_authentication = false
    ssh_keys {
      path     = "/home/${var.vm_admin_username}/.ssh/authorized_keys"
      key_data = var.vm_ssh_key
    }
  }
}

resource "azurerm_network_interface" "nic_subscription2" {
  count               = var.vm_count
  provider            = azurerm.subscription2
  name                = "nic-subscription2-${count.index}"
  location            = var.region
  resource_group_name = var.resource_group_name_subscription2

  ip_configuration {
    name                          = var.subnet_name_subscription2
    subnet_id                     = var.subnet_id_subscription2
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_network_interface_security_group_association" "nsg_association_subscription2" {
  count                    = var.vm_count
  network_interface_id     = azurerm_network_interface.nic_subscription2[count.index].id
  network_security_group_id = azurerm_network_security_group.nsg_subscription2.id
}

resource "azurerm_network_security_group" "nsg_subscription2" {
  provider            = azurerm.subscription2
  name                = "nsg-subscription2"
  location            = var.region
  resource_group_name = var.resource_group_name_subscription2

  security_rule {
    name                       = "Allow-SSH-Inbound"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}
