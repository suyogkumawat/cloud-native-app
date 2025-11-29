variable "aws_region" {
  type        = string
  default     = "ap-south-1"
}

variable "cluster_name" {
  type        = string
  default     = "vault-eks-cluster"
}

variable "db_name" {
  type        = string
  default     = "vaultdb"
}

variable "db_username" {
  type        = string
  default     = "appuser"
}

variable "db_password" {
  type        = string
  sensitive   = true
}

