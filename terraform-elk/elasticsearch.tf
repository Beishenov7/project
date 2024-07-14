provider "kubernetes" {
  config_path = "~/.kube/config"
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

resource "null_resource" "helm_repo_add" {
  provisioner "local-exec" {
    command = "helm repo add elastic https://helm.elastic.co && helm repo add prometheus-community https://prometheus-community.github.io/helm-charts"
  }

  triggers = {
    always_run = "${timestamp()}"
  }
}

resource "null_resource" "helm_repo_update" {
  provisioner "local-exec" {
    command = "helm repo update"
  }

  triggers = {
    always_run = "${timestamp()}"
  }
  
  depends_on = [null_resource.helm_repo_add]
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