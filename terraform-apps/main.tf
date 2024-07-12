provider "kubernetes" {
  config_path = "~/.kube/config"
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

resource "helm_release" "api" {
  name       = "api"
  chart      = "../helm/api"
  version    = "0.1.0"
}
