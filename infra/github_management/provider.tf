#
terraform {
  required_providers {
    github = {
      #source  = "integrations/github"
      source  = "hashicorp/github"
      version = "6.2.3"
    }
  }
  #
}

provider "github" {
  owner = var.github.owner
  # add your github token here.
  token = local.github_token
}