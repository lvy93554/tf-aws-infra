terraform {
  required_version = ">= v1.6.6"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.31.0"
    }
  }
}

resource "aws_vpc" "vpc" {
  count = var.cloud == "aws" && var.res_type == "vpc" ? 1 : 0

  cidr_block           = var.vpc_cidr
  instance_tenancy     = "default"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = merge(
    var.tags,
    {
      "Name"        = var.vpc_name,
      "description" = var.description
    }
  )
}

resource "aws_subnet" "subnet" {
  count = var.cloud == "aws" && var.res_type == "subnet" ? 1 : 0

  vpc_id            = var.vpc_id
  availability_zone = var.az_name
  cidr_block        = var.subnet_cidr

  map_public_ip_on_launch = var.auto_assign_public_ip

  enable_resource_name_dns_a_record_on_launch = true

  tags = merge(
    var.tags,
    {
      "Name"        = var.subnet_name
      "description" = var.description
    }
  )
}
