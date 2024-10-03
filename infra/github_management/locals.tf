locals {
  github_token = data.local_file.input_template.content
}
#
data "local_file" "input_template" {
  filename = "../credentials/github_token"
}
#
