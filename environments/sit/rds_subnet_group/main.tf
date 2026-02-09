terraform {
  required_version = ">= v1.6.6"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.31.0"
    }
  }
}

module "sitRdsSubnetGroup" {
  source = "../../../modules/rds_subnet_group"

  cloud       = "aws"
  res_type    = "dbSubnetGroup"
  name        = "sit_rds_subnets_group"
  description = "Sit RDS Subnets Group"
  subnets     = data.aws_subnets.subnets.ids

  tags = {
    "env"           = "Sit",
    "region"        = "ap-south-1",
    "owner"         = "SkyCloud",
    "Terraform"     = "true",
    "business_type" = "RDSSubnet",
    "security_zone" = "internal"
  }
}
