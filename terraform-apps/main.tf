provider "kubernetes" {
  config_path = "~/.kube/config"
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

resource "helm_release" "services" {
  for_each = local.helm_releases

  name       = each.key
  chart      = each.value.chart
  version    = each.value.version
}
