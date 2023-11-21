variable "subscription_id" {
  description = "Subscription ID"
  type        = string
}

variable "tenant_id" {
  description = "Tenant ID"
  type        = string
}

# variable "container_name" {
#   description = "Name for Storage Account Container"
#   type        = string
# }

variable "location" {
  description = "(Optional) A string for the location of the resource group."
  type        = string
  default     = "australiasoutheast"
}

# variable "key" {
#   description = "Name for TF State Key"
#   type        = string
# }


# variable "tags" {
#   description = "(Optional) A key-value map of tags for the resource group."
#   default     = {}
# }

variable "resource_group_name" {
  description = "Name for Resource Group"
  type        = string
}

# variable "storage_account_name" {
#   description = "Name for Storage Account"
#   type        = string
# }

variable "aks_cluster_name" {
  description = "Name for AKS Cluster"
  type        = string
}