resource "helm_release" "kibana" {
  depends_on = [null_resource.helm_repo_update]
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
    value = "100Mi"
  }
}
