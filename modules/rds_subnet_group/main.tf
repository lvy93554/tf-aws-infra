terraform {
  required_version = ">= v1.6.6"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.31.0"
    }
  }
}

resource "aws_db_subnet_group" "dbSubnetGroup" {
  count = var.cloud == "aws" && var.res_type == "dbSubnetGroup" ? 1 : 0

  name        = var.name
  description = var.description
  subnet_ids  = var.subnets

  tags = merge(
    var.tags,
    {
      "Name"        = var.name
      "description" = var.description
    }
  )
}