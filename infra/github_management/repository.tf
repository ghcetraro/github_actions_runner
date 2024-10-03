# https://spacelift.io/blog/terraform-github
#
resource "github_repository" "tf" {
  for_each   = var.repository
  name       = lookup(each.value, "name", each.key)
  visibility = lookup(each.value, "visibility", "private")
  auto_init  = lookup(each.value, "auto_init", true)
}
#
resource "github_branch" "master" {
  for_each   = var.repository
  repository = github_repository.tf[each.key].name
  branch     = "master"
}
#
resource "github_branch_default" "default" {
  for_each   = var.repository
  repository = github_repository.tf[each.key].name
  branch     = github_branch.master[each.key].branch
}
#
resource "github_branch" "develop" {
  for_each   = var.repository
  repository = github_repository.tf[each.key].name
  branch     = "develop"
}
#
#module "secrets" {
#  source = "./secrets"
#  #
#  for_each   = var.repository
#  repository = github_repository.tf[each.key].name
#  secrets    = each.value.secrets
#}
#