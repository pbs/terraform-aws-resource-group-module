resource "aws_resourcegroups_group" "group" {
  name        = local.name
  description = local.description

  resource_query {
    query = local.query
  }

  tags = local.tags
}
