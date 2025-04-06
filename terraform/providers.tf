provider "aws" {
  region = var.region
}

# Aliased provider to target a different AWS account via IAM assume role
provider "aws" {
  alias  = "env"
  region = var.region

  assume_role {
    role_arn = var.assume_role_arn  # Passed from workspace/env-specific vars
  }
}