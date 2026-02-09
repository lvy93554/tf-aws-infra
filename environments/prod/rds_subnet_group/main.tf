terraform {
  required_version = ">= v1.6.6"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.31.0"
    }
  }
}

module "ProdRdsSubnetGroup" {
  source = "../../../modules/rds_subnet_group"

  cloud       = "aws"
  res_type    = "dbSubnetGroup"
  name        = "Prod_rds_subnets_group"
  description = "Prod RDS Subnets Group"
  subnets     = data.aws_subnets.subnets.ids

  tags = {
    "env"           = "Prod",
    "region"        = "ap-south-1",
    "owner"         = "SkyCloud",
    "Terraform"     = "true",
    "business_type" = "RDSSubnet",
    "security_zone" = "internal"
  }
}
