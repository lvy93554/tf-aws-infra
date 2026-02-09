terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.31.0"
    }
  }
}

##########################################################
# NATGateway
module "Prod_1a_natGateway" {
  source = "../../../modules/network"

  cloud             = "aws"
  res_type          = "natGateway"
  natGateway_name   = "Prod_NATGateway"
  connectivity_type = "public"
  subnet_id         = data.aws_subnet.publicSubnet_1a_1b.id
  allocation_id     = data.aws_eip.natGateway_1a_1b_Eip.id
  description       = "Prod 1a1b可用区NATGateway"

  tags = {
    "env"           = "Prod",
    "region"        = "ap-south-1",
    "az"            = "ap-south-1a",
    "owner"         = "SkyCloud",
    "Terraform"     = "true",
    "business_type" = "NATGateway"
  }
}

##########################################################
# EIP
module "Prod_1a_1b_natGateway_eip" {
  source = "../../../modules/network"

  cloud       = "aws"
  res_type    = "eip"
  eip_name    = "Prod_1a_1b_NATGW_eip"
  description = "Prod 1a可用区NATGateway的EIP"

  tags = {
    "env"           = "Prod",
    "region"        = "ap-south-1",
    "owner"         = "SkyCloud",
    "Terraform"     = "true",
    "business_type" = "EIP"
  }
}

##########################################################
# InternetGateway
module "Prod_internetGateway" {
  source = "../../../modules/network"

  cloud                = "aws"
  res_type             = "internetGateway"
  internetGateway_name = "Prod_internetGateway"
  description          = "Prod区域internetGateway"

  tags = {
    "env"           = "Prod",
    "region"        = "ap-south-1",
    "owner"         = "SkyCloud",
    "Terraform"     = "true",
    "business_type" = "InternetGateway"
  }
}

module "Prod_internetGateway_Att" {
  source = "../../../modules/network"

  cloud             = "aws"
  res_type          = "internetGatewayAtt"
  internetGatewayId = data.aws_internet_gateway.ProdInternetGw.id
  vpc_id            = data.aws_vpc.Prod.id
}

##########################################################
# Route Private 1a
module "Prod_private_1a_routeTable" {
  source = "../../../modules/route"

  cloud       = "aws"
  res_type    = "routeTable"
  name        = "Prod_private_1a_routeTable"
  description = "Prod 区域1a可用区private路由表"
  vpc_id      = data.aws_vpc.Prod.id

  tags = {
    "env"            = "Prod",
    "region"         = "ap-south-1",
    "az"             = "ap-south-1a",
    "owner"          = "SkyCluod",
    "Terraform"      = "true",
    "routeTableType" = "private"
  }
}

module "Prod_private_1a_Ass" {
  source = "../../../modules/route"

  cloud          = "aws"
  res_type       = "routeTableAss"
  subnet_id      = data.aws_subnet.privateSubnet_1a.id
  route_table_id = data.aws_route_table.privateRouteTable_1a.id
}

module "subnet1aToNatGateway" {
  source = "../../../modules/route"

  cloud               = "aws"
  res_type            = "routeRule"
  route_table_id      = data.aws_route_table.privateRouteTable_1a.id
  destination_address = "0.0.0.0/0"
  nat_gateway_id      = data.aws_nat_gateway.private_1a_natGateway.id
}

##########################################################
# Route Private 1b
module "Prod_private_1b_routeTable" {
  source = "../../../modules/route"

  cloud       = "aws"
  res_type    = "routeTable"
  name        = "Prod_private_1b_routeTable"
  description = "Prod 区域1b可用区private路由表"
  vpc_id      = data.aws_vpc.Prod.id

  tags = {
    "env"            = "Prod",
    "region"         = "ap-south-1",
    "az"             = "ap-south-1b",
    "owner"          = "SkyCluod",
    "Terraform"      = "true",
    "routeTableType" = "private"
  }
}

module "Prod_private_1b_Ass" {
  source = "../../../modules/route"

  cloud          = "aws"
  res_type       = "routeTableAss"
  subnet_id      = data.aws_subnet.privateSubnet_1b.id
  route_table_id = data.aws_route_table.privateRouteTable_1b.id
}

module "subnet1bToNatGateway" {
  source = "../../../modules/route"

  cloud               = "aws"
  res_type            = "routeRule"
  route_table_id      = data.aws_route_table.privateRouteTable_1b.id
  destination_address = "0.0.0.0/0"
  # 和1a可用区同一个NATGateway
  nat_gateway_id = data.aws_nat_gateway.private_1a_natGateway.id
}

##########################################################
# Route Public 1a
# 创建路由表(public subnet共用一个路由表即可。但是每个private subnet都要创建一个自己的路由表)
module "Prod_public_routeTable" {
  source = "../../../modules/route"

  cloud       = "aws"
  res_type    = "routeTable"
  name        = "Prod_public_routeTable"
  description = "Prod区域public路由表"
  vpc_id      = data.aws_vpc.Prod.id

  tags = {
    "env"            = "Prod",
    "region"         = "ap-south-1",
    "owner"          = "SkyCluod",
    "Terraform"      = "true",
    "routeTableType" = "public"
  }
}

module "Prod_public_1a_Ass" {
  source = "../../../modules/route"

  for_each = toset(data.aws_subnets.publicSubnets.ids)

  cloud          = "aws"
  res_type       = "routeTableAss"
  subnet_id      = each.value
  route_table_id = data.aws_route_table.publicRouteTable.id
}

module "public1aToInternetGateway" {
  source = "../../../modules/route"

  cloud               = "aws"
  res_type            = "routeRule"
  route_table_id      = data.aws_route_table.publicRouteTable.id
  destination_address = "0.0.0.0/0"
  gateway_id          = data.aws_internet_gateway.ProdInternetGw.id
}

##########################################################
# Route Public 1b
# public subnet只需要一个路由表即可
module "Prod_public_1b_Ass" {
  source = "../../../modules/route"

  for_each = toset(data.aws_subnets.publicSubnets.ids)

  cloud          = "aws"
  res_type       = "routeTableAss"
  subnet_id      = each.value
  route_table_id = data.aws_route_table.publicRouteTable.id
}

module "public1bToInternetGateway" {
  source = "../../../modules/route"

  cloud               = "aws"
  res_type            = "routeRule"
  route_table_id      = data.aws_route_table.publicRouteTable.id
  destination_address = "0.0.0.0/0"
  gateway_id          = data.aws_internet_gateway.ProdInternetGw.id
}
