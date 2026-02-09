terraform {
  required_version = ">= v1.6.6"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.31.0"
    }
  }
}


resource "aws_security_group" "secGroup" {
  count = var.cloud == "aws" && var.res_type == "secGroup" ? 1 : 0

  name        = var.name
  description = var.description
  vpc_id      = var.vpc_id
  tags = merge(
    var.tags,
    {
      "Name"        = var.name,
      "description" = var.description
    }
  )
}


resource "aws_security_group_rule" "secGroupRule" {
  count = var.cloud == "aws" && var.res_type == "secGroupRule" ? 1 : 0

  type              = var.ether_type
  from_port         = var.from_port
  to_port           = var.to_port
  protocol          = var.protocol
  cidr_blocks       = var.cidr_blocks
  description       = var.description
  security_group_id = var.security_group_id
}