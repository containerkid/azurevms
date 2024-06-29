variable "subscription1_id" {
  description = "The subscription ID for the first Azure subscription"
}

variable "subscription2_id" {
  description = "The subscription ID for the second Azure subscription"
}

variable "region" {
  description = "The region where the VMs will be created"
  type        = string
  default     = "westeurope"
}

variable "vm_size" {
  description = "The size of the VMs"
  type        = string
}

variable "vm_count" {
  description = "The number of VMs to create in each subscription"
  type        = number
}

variable "vnet_name_subscription1" {
  description = "The VNet name for the first subscription"
  type        = string
}

variable "vnet_name_subscription2" {
  description = "The VNet name for the second subscription"
  type        = string
}

variable "subnet_id_subscription1" {
  description = "The subnet ID for the first subscription"
  type        = string
}

variable "subnet_name_subscription1" {
  description = "The subnet name for the first subscription"
  type        = string
}

variable "subnet_id_subscription2" {
  description = "The subnet ID for the second subscription"
  type        = string
}

variable "subnet_name_subscription2" {
  description = "The subnet name for the second subscription"
  type        = string
}

variable "resource_group_name_subscription1" {
  description = "The resource group name for the first subscription"
  type        = string
}

variable "resource_group_name_subscription2" {
  description = "The resource group name for the second subscription"
  type        = string
}

variable "vm_admin_username" {
  description = "The admin username for the VMs"
  type        = string
}

variable "vm_authentication_type" {
  description = "The type of authentication to use (password or ssh)"
  type        = string
}

variable "vm_admin_password" {
  description = "The admin password for the VMs (required if using password authentication)"
  type        = string
  default     = ""
}

variable "vm_ssh_key" {
  description = "The SSH public key for the VMs (required if using SSH key authentication)"
  type        = string
  default     = ""
}

variable "vm_name" {
  description = "The base name for the virtual machines"
  type        = string
}
