provider "kubernetes" {
  config_path = "~/.kube/config"
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

resource "helm_repository" "elastic" {
  name = "elastic"
  url  = "https://helm.elastic.co"
}

resource "helm_repository" "prometheus_community" {
  name = "prometheus-community"
  url  = "https://prometheus-community.github.io/helm-charts"
}

resource "null_resource" "helm_repo_update" {
  provisioner "local-exec" {
    command = "helm repo update"
  }

  triggers = {
    always_run = "${timestamp()}"
  }

  depends_on = [
    helm_repository.elastic,
    helm_repository.prometheus_community
  ]
}

resource "helm_release" "elasticsearch" {
  depends_on = [null_resource.helm_repo_update]
  name       = "elasticsearch"
  repository = "elastic https://helm.elastic.co"
  chart      = "elastic/elasticsearch"
  version    = "8.5.1"

  set {
    name  = "replicas"
    value = "2"
  }

  set {
    name  = "resources.requests.cpu"
    value = "100m"
  }

  set {
    name  = "resources.requests.memory"
    value = "100Mi"
  }
}


resource "helm_release" "prometheus_stack" {
  depends_on = [null_resource.helm_repo_update]

  name       = "prometheus-stack"
  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "kube-prometheus-stack"
  version    = "61.3.1"
}