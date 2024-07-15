resource "helm_release" "prometheus_stack" {
  depends_on = [null_resource.helm_repo_update]

  name       = "prometheus-stack"
  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "kube-prometheus-stack"
  version    = "61.3.1"
}