terraform {
  required_version = ">= v1.6.6"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.31.0"
    }
  }
}

# 创建VPC路由表
resource "aws_route_table" "routeTable" {
  count = var.cloud == "aws" && var.res_type == "routeTable" ? 1 : 0

  vpc_id = var.vpc_id

  tags = merge(
    var.tags,
    {
      "Name"        = var.name,
      "description" = var.description
    }
  )
}

# 在 VPC 路由表中创建路由表条目（路由）
resource "aws_route" "routeRule" {
  count = var.cloud == "aws" && var.res_type == "routeRule" ? 1 : 0

  route_table_id = var.route_table_id
  destination_cidr_block    = var.destination_address
  vpc_peering_connection_id = var.vpc_peering_connection_id == "" ? null : var.vpc_peering_connection_id
  nat_gateway_id            = var.nat_gateway_id == "" ? null : var.nat_gateway_id
  gateway_id                = var.gateway_id == "" ? null : var.gateway_id
  transit_gateway_id        = var.transit_gateway_id == "" ? null : var.transit_gateway_id
}

resource "aws_route_table_association" "routeTableAss" {
  count = var.cloud == "aws" && var.res_type == "routeTableAss" ? 1 : 0

  subnet_id      = var.subnet_id
  route_table_id = var.route_table_id
}
