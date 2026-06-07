variable "resource_group_name" {
  description = "Name of the Resource Group"
  type        = string
}

variable "location" {
  description = "Azure Region"
  type        = string
}

variable "tags" {
  description = "Resource Tags"
  type        = map(string)

  default = {
    Environment = "Dev"
    ManagedBy   = "Terraform"
  }
}