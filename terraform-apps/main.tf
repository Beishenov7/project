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

resource "helm_release" "web" {
  name       = "web"
  chart      = "../helm/web"
  version    = "0.1.0"
}

resource "helm_release" "mysql" {
  name       = "mysql"
  chart      = "../helm/mysql"
  version    = "0.1.0"
}
