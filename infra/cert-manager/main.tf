# https://github.com/actions/actions-runner-controller/blob/master/docs/quickstart.md
#
resource "kubernetes_namespace" "cert-manager" {
  metadata {
    annotations = {}
    labels      = {}
    name        = "cert-manager"
  }
}
#
resource "helm_release" "cert-manager" {
  name             = "cert-manager"
  repository       = "https://charts.jetstack.io"
  namespace        = "cert-manager"
  create_namespace = false
  chart            = "cert-manager"
  version          = "v1.14.4"
  atomic           = true
  reset_values     = true
  timeout          = 900
  cleanup_on_fail  = true
  recreate_pods    = true
  #
  set {
    name  = "installCRDs"
    value = "true"
  }
  #
  depends_on = [kubernetes_namespace.cert-manager]
}