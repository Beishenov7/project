provider "kubernetes" {
  config_path = "~/.kube/config"
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

resource "helm_release" "filebeat" {
  name       = "filebeat"
  repository = "elastic https://helm.elastic.co"
  chart      = "elastic/filebeat"
  version    = "8.5.1"
}
