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
