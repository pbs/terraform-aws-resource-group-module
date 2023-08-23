locals {
  name        = var.name != null ? var.name : var.product
  description = var.description != null ? var.description : "Resource group for ${var.product} in ${var.environment}."

  query = var.query != null ? var.query : jsonencode({
    ResourceTypeFilters = [
      "AWS::AllSupported"
    ]

    TagFilters = [
      {
        Key = "${var.organization}:billing:product"
        Values = [
          var.product
        ]
      },
      {
        Key = "${var.organization}:billing:environment"
        Values = [
          var.environment
        ]
      },
    ]
  })

  creator = "terraform"

  defaulted_tags = merge(
    var.tags,
    {
      Name                                      = local.name
      "${var.organization}:billing:product"     = var.product
      "${var.organization}:billing:environment" = var.environment
      creator                                   = local.creator
      repo                                      = var.repo
    }
  )

  tags = merge({ for k, v in local.defaulted_tags : k => v if lookup(data.aws_default_tags.common_tags.tags, k, "") != v })
}

data "aws_default_tags" "common_tags" {}
