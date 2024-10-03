# Add teams
resource "github_team" "team" {
  for_each    = toset(var.team)
  name        = each.key
  description = "${each.key} team"
}
# Add a user to the organization
resource "github_membership" "membership" {
  for_each = var.membership
  username = lookup(each.value, "username", null)
  # or "admin" for an org owner
  role = lookup(each.value, "role", null)
}
# Add users to teams
resource "github_team_membership" "team_membership" {
  for_each = var.team_membership
  username = lookup(each.value, "username", each.key)
  team_id  = lookup(each.value, "team_id", null)
  role     = lookup(each.value, "role", "member")
}