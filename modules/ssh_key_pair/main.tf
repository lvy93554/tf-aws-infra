terraform {
  required_version = ">= v1.6.6"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.31.0"
    }
  }
}

resource "aws_key_pair" "ssh_ec2" {
  count = var.cloud == "aws" && var.res_type == "key_pair" ? 1 : 0

  key_name   = var.ssh_key_pair_name
  public_key = file(var.ssh_public_key_path)

  tags = merge(
    var.tags,
    {
      "Name"        = var.ssh_key_pair_name,
      "description" = var.description
    }
  )
}