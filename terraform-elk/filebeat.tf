resource "helm_release" "filebeat" {
  depends_on = [null_resource.helm_repo_update]
  name       = "filebeat"
  repository = "elastic https://helm.elastic.co"
  chart      = "elastic/filebeat"
  version    = "8.5.1"
}
