data "aws_vpc" "Sit" {
  tags = {
    "Name" = "Sit"
  }
}

# 筛选用于DB使用的子网
data "aws_subnets" "subnets" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.Sit.id]
  }

  tags = {
    "env"           = "Sit",
    "business_type" = "db",
    "security_zone" = "internal"
  }
}
