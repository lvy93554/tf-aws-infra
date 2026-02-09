locals {
  secGroups = {
    for i in data.aws_security_group.secGroup :
    i["name"] => i["id"]
  }
}

data "aws_vpc" "Prod" {
  tags = {
    "Name" = "Prod"
  }
}

# 筛选用于DB使用的子网
data "aws_subnets" "subnets" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.Prod.id]
  }

  tags = {
    "env"           = "Prod",
    "business_type" = "db",
    "security_zone" = "internal"
  }
}

data "aws_security_groups" "secGroups" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.Prod.id]
  }
}

data "aws_security_group" "secGroup" {
  for_each = toset(data.aws_security_groups.secGroups.ids)
  id       = each.value
}
