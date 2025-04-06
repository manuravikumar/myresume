variable "location" {
  description = "Azure region to deploy resources"
  type        = string
  default     = "Australia East"
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default     = "rg-resume"
}

variable "storage_account_name" {
  description = "Globally unique name of the storage account"
  type        = string
  default     = "resumestorageacct"
}
