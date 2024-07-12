resource "helm_release" "filebeat" {
  name       = "filebeat"
  repository = "elastic https://helm.elastic.co"
  chart      = "elastic/filebeat"
  version    = "8.5.1"
}
