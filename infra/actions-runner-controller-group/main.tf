# https://github.com/actions/actions-runner-controller/blob/master/docs/quickstart.md
#
resource "kubernetes_namespace" "runner" {
  metadata {
    annotations = {}
    labels      = {}
    name        = "actions-runner-system-group"
  }
}
#
resource "helm_release" "actions-runner-controller" {
  name             = "actions-runner-controller"
  repository       = "https://actions-runner-controller.github.io/actions-runner-controller"
  namespace        = kubernetes_namespace.runner.metadata[0].name
  create_namespace = false
  chart            = "actions-runner-controller"
  version          = "0.23.7"
  atomic           = true
  reset_values     = true
  timeout          = 900
  cleanup_on_fail  = true
  recreate_pods    = true
  #
  values = [templatefile("${path.module}/manifests/values.yaml", {
    github_token = local.github_token
  })]
  #
  depends_on = [kubernetes_namespace.runner]
}