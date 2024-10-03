# tfenv use 1.4.6
#
terraform {
  required_providers {
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = ">=1.7.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = ">=1.3.2"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.12.1"
    }
  }
}
#
#
provider "helm" {
  kubernetes {
    config_path = "../credentials/kube-config"
  }
}
#
provider "kubernetes" {
  config_path = "../credentials/kube-config"
}
