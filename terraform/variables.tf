variable "region" {
  description = "AWS Region for deployment"
  type        = string
  default     = "us-east-1"
}

variable "environment" {
  description = "Name of the environment (e.g. dev, qa, uat, prod)"
  type        = string
  default     = "dev"
}

variable "assume_role_arn" {
  description = "The ARN of the IAM role to assume in the target AWS account for this environment."
  type        = string
}

variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
  default     = "eks-auto-cluster"
}

variable "subnet_ids" {
  description = "List of subnet IDs for the EKS cluster (must be in the target account)"
  type        = list(string)
}

variable "endpoint_public_access" {
  description = "Should the EKS cluster API endpoint be publicly accessible?"
  type        = bool
  default     = false
}

variable "endpoint_private_access" {
  description = "Should the EKS cluster API endpoint be privately accessible?"
  type        = bool
  default     = true
}

variable "public_access_cidrs" {
  description = "List of CIDRs allowed to access the public endpoint (if enabled)"
  type        = list(string)
  default     = []
}

variable "node_pools" {
  description = "List of node pool names for Auto Mode"
  type        = list(string)
  default     = ["general-purpose", "system"]
}

variable "k8s_version" {
  description = "Kubernetes version for the EKS cluster"
  type        = string
  default     = "1.23"
}

variable "enabled_cluster_log_types" {
  description = "List of log types to enable for the cluster"
  type        = list(string)
  default     = ["api", "audit", "authenticator", "controllerManager", "scheduler"]
}

variable "kms_key_arn" {
  description = "KMS Key ARN for encrypting Kubernetes secrets"
  type        = string
}

variable "tags" {
  description = "Additional tags for resources"
  type        = map(string)
  default     = {}
}