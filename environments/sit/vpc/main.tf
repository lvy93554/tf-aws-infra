terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.31.0"
    }
  }
}

module "Sit_vpc" {
  source = "../../../modules/vpc"

  cloud       = "aws"
  res_type    = "vpc"
  vpc_name    = "Sit"
  vpc_cidr    = "10.10.0.0/16"
  description = "PaaS平台Sit环境VPC"

  tags = {
    "env"       = "Sit",
    "region"    = "ap-south-1",
    "owner"     = "SkyCloud",
    "Terraform" = "true"
  }
}

module "Dmz_public_1a_Subnet" {
  source = "../../../modules/vpc"

  cloud                 = "aws"
  res_type              = "subnet"
  subnet_name           = "sit_dmz_public_1a"
  az_name               = "ap-south-1a"
  subnet_cidr           = "10.10.0.0/21"
  auto_assign_public_ip = true
  vpc_id                = data.aws_vpc.Sit.id
  description           = "PaaS平台Sit环境DMZ区域1a可用区"

  tags = {
    "env"           = "Sit",
    "region"        = "ap-south-1",
    "az"            = "ap-south-1a",
    "owner"         = "SkyCloud",
    "Terraform"     = "true",
    "security_zone" = "dmz",
    "subnet_type"   = "public"
  }

  depends_on = [
    data.aws_vpc.Sit
  ]
}

module "Dmz_public_1b_Subnet" {
  source = "../../../modules/vpc"

  cloud                 = "aws"
  res_type              = "subnet"
  subnet_name           = "sit_dmz_public_1b"
  az_name               = "ap-south-1b"
  subnet_cidr           = "10.10.8.0/21"
  auto_assign_public_ip = true
  vpc_id                = data.aws_vpc.Sit.id
  description           = "PaaS平台Sit环境DMZ区域1b可用区"

  tags = {
    "env"           = "Sit",
    "region"        = "ap-south-1",
    "az"            = "ap-south-1b",
    "owner"         = "SkyCloud",
    "Terraform"     = "true",
    "security_zone" = "dmz",
    "subnet_type"   = "public"
  }

  depends_on = [
    data.aws_vpc.Sit
  ]
}

module "Internal_private_1a_Subnet" {
  source = "../../../modules/vpc"

  cloud       = "aws"
  res_type    = "subnet"
  subnet_name = "sit_internal_private_1a"
  az_name     = "ap-south-1a"
  subnet_cidr = "10.10.16.0/21"
  vpc_id      = data.aws_vpc.Sit.id
  description = "PaaS平台Sit环境Internal区域1a可用区"

  tags = {
    "env"           = "Sit",
    "region"        = "ap-south-1",
    "az"            = "ap-south-1a",
    "owner"         = "SkyCloud",
    "Terraform"     = "true",
    "security_zone" = "internal",
    "business_type" = "other",
    "subnet_type"   = "private"
  }

  depends_on = [
    data.aws_vpc.Sit
  ]
}

module "Internal_private_1b_Subnet" {
  source = "../../../modules/vpc"

  cloud       = "aws"
  res_type    = "subnet"
  subnet_name = "sit_internal_private_1b"
  az_name     = "ap-south-1b"
  subnet_cidr = "10.10.24.0/21"
  vpc_id      = data.aws_vpc.Sit.id
  description = "PaaS平台Sit环境Internal区域1b可用区"

  tags = {
    "env"           = "Sit",
    "region"        = "ap-south-1",
    "az"            = "ap-south-1b",
    "owner"         = "SkyCloud",
    "Terraform"     = "true",
    "security_zone" = "internal",
    "business_type" = "other",
    "subnet_type"   = "private"
  }

  depends_on = [
    data.aws_vpc.Sit
  ]
}

module "Internal_private_1a_DB_Subnet" {
  source = "../../../modules/vpc"

  cloud       = "aws"
  res_type    = "subnet"
  subnet_name = "sit_internal_private_db_1a"
  az_name     = "ap-south-1a"
  subnet_cidr = "10.10.32.0/24"
  vpc_id      = data.aws_vpc.Sit.id
  description = "PaaS平台Sit环境Internal区域1a可用区DB子网"

  tags = {
    "env"           = "Sit",
    "region"        = "ap-south-1",
    "az"            = "ap-south-1a",
    "owner"         = "SkyCloud",
    "Terraform"     = "true",
    "security_zone" = "internal",
    "business_type" = "db",
    "subnet_type"   = "private"
  }

  depends_on = [
    data.aws_vpc.Sit
  ]
}

module "Internal_private_1b_DB_Subnet" {
  source = "../../../modules/vpc"

  cloud       = "aws"
  res_type    = "subnet"
  subnet_name = "sit_internal_private_db_1b"
  az_name     = "ap-south-1b"
  subnet_cidr = "10.10.33.0/24"
  vpc_id      = data.aws_vpc.Sit.id
  description = "PaaS平台Sit环境Internal区域1b可用区DB子网"

  tags = {
    "env"           = "Sit",
    "region"        = "ap-south-1",
    "az"            = "ap-south-1b",
    "owner"         = "SkyCloud",
    "Terraform"     = "true",
    "security_zone" = "internal",
    "business_type" = "db",
    "subnet_type"   = "private"
  }

  depends_on = [
    data.aws_vpc.Sit
  ]
}


