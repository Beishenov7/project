provider "kubernetes" {
  config_path = "~/.kube/config"
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

resource "helm_release" "example" {
  name       = "example-release"
  repository = "elastic https://helm.elastic.co"
  chart      = "elastic/filebeat"
  version    = "8.5.1"
}
