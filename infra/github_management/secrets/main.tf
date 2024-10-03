variable "secrets" {}
variable "repository" {}
#
resource "github_actions_secret" "tf" {
  for_each        = var.secrets
  repository      = var.repository
  secret_name     = lookup(each.value, "secret_name", null)
  plaintext_value = lookup(each.value, "plaintext_value", null)
}