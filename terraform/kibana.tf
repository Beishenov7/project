provider "kubernetes" {
  config_path = "~/.kube/config"
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

resource "helm_release" "kibana" {
  name       = "kibana"
  repository = "elastic https://helm.elastic.co"
  chart      = "elastic/kibana"
  version    = "8.5.1"

  set {
    name  = "resources.requests.cpu"
    value = "100m"
  }

  set {
    name  = "resources.requests.memory"
    value = "1Gi"
  }
}
