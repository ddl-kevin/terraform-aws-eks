variable "eks_node_role_arns" {
  type        = list(string)
  description = "Roles arns for EKS nodes to be added to aws-auth for api auth."
}

variable "eks_master_role_arns" {
  type        = list(string)
  description = "IAM role arns to be added as masters in eks."
  default     = []
}

variable "calico_version" {
  type        = string
  description = "Calico operator version."
  default     = "v1.11.0"
}
