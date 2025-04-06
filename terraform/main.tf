provider "aws" {
  region = var.region
}

# Provider alias that assumes a role into the target AWS account for the given environment.
provider "aws" {
  alias  = "env"
  region = var.region

  assume_role {
    role_arn = var.assume_role_arn
  }
}

module "eks_cluster" {
  source    = "./modules/eks"
  providers = {
    aws = aws.env
  }

  cluster_name            = var.cluster_name
  subnet_ids              = var.subnet_ids
  endpoint_public_access  = var.endpoint_public_access
  endpoint_private_access = var.endpoint_private_access
  public_access_cidrs     = var.public_access_cidrs
  node_pools              = var.node_pools
  k8s_version             = var.k8s_version
  enabled_cluster_log_types = var.enabled_cluster_log_types
  kms_key_arn             = var.kms_key_arn
  tags                    = merge(var.tags, { Environment = var.environment })
}