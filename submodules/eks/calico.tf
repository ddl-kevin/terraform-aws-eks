resource "helm_release" "calico" {
  count = var.direct_configuration ? 1 : 0

  name = "tigera-operator"

  repository = "https://docs.projectcalico.org/charts"
  chart      = "tigera-operator"
  version    = var.tigera_version
}