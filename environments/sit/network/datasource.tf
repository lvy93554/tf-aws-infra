locals {
  vms = {
    for i in data.aws_instance.vm :
    i["tags"]["Name"] => i["id"]
  }
  eips = {
    for i in data.aws_eip.eip :
    i["tags"]["Name"] => i["id"]
  }
}

data "aws_vpc" "Sit" {
  tags = {
    "Name" = "Sit"
  }
}

data "aws_route_table" "privateRouteTable_1a" {
  vpc_id = data.aws_vpc.Sit.id
  tags = {
    "routeTableType" = "private",
    "az"             = "ap-south-1a"
  }

  depends_on = [
    module.Sit_private_1a_routeTable
  ]
}

data "aws_route_table" "privateRouteTable_1b" {
  vpc_id = data.aws_vpc.Sit.id
  tags = {
    "routeTableType" = "private",
    "az"             = "ap-south-1b"
  }

  depends_on = [
    module.Sit_private_1b_routeTable
  ]
}

data "aws_route_table" "publicRouteTable" {
  vpc_id = data.aws_vpc.Sit.id
  tags = {
    "routeTableType" = "public"
  }

  depends_on = [
    module.Sit_public_routeTable
  ]
}

data "aws_subnets" "publicSubnets" {
  tags = {
    "env"           = "Sit",
    "security_zone" = "dmz"
  }
}

data "aws_internet_gateway" "sitInternetGw" {
  tags = {
    "Name" = "Sit_internetGateway"
  }

  depends_on = [
    module.Sit_internetGateway
  ]
}

# 筛选出private subnet 1a区域并且非DB专属的private subnet
data "aws_subnet" "privateSubnet_1a" {
  filter {
    name   = "availability-zone"
    values = ["ap-south-1a"]
  }
  tags = {
    "env"           = "Sit",
    "business_type" = "other",
    "security_zone" = "internal"
  }
}

# 筛选出private subnet 1b区域并且非DB专属的private subnet
data "aws_subnet" "privateSubnet_1b" {
  filter {
    name   = "availability-zone"
    values = ["ap-south-1b"]
  }
  tags = {
    "env"           = "Sit",
    "business_type" = "other",
    "security_zone" = "internal"
  }
}

data "aws_subnet" "publicSubnet_1a_1b" {
  filter {
    name   = "availability-zone"
    values = ["ap-south-1a"]
  }
  tags = {
    "env"           = "Sit",
    "security_zone" = "dmz"
  }
}

data "aws_eip" "natGateway_1a_1b_Eip" {
  tags = {
    "Name" = "Sit_1a_1b_NATGW_eip"
  }

  depends_on = [
    module.Sit_1a_1b_natGateway_eip
  ]
}

data "aws_nat_gateway" "private_1a_natGateway" {
  state = "available"
  tags = {
    "env" = "Sit",
    "az"  = "ap-south-1a"
  }

  depends_on = [
    module.Sit_1a_natGateway
  ]
}

data "aws_eips" "eips" {
  tags = {
    "env" = "Sit"
  }
}

data "aws_eip" "eip" {
  count = length(data.aws_eips.eips.allocation_ids)
  id    = data.aws_eips.eips.allocation_ids[count.index]
}

data "aws_instances" "vms" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.Sit.id]
  }
  instance_state_names = ["stopped", "running"]
}

data "aws_instance" "vm" {
  count       = length(data.aws_instances.vms.ids)
  instance_id = data.aws_instances.vms.ids[count.index]
}
