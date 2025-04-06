terraform {
  backend "remote" {
    organization = "your-hcp-organization-name"    # 🔁 Replace with your HCP org name

    workspaces {
      name = "eks-${terraform.workspace}"          # Supports multiple workspaces (dev, qa, prod, etc.)
    }
  }
}