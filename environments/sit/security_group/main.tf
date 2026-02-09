terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.31.0"
    }
  }
}

# Sit环境linux默认的安全组
module "Sit_private_linux_internal_SecGroup" {
  source = "../../../modules/security_group"

  cloud       = "aws"
  res_type    = "secGroup"
  name        = "Sit_private_internal_linux_SecGroup"
  description = "Sit VPC private linux security group"
  vpc_id      = data.aws_vpc.Sit.id

  tags = {
    "env"           = "Sit",
    "region"        = "ap-south-1",
    "owner"         = "SkyCloud",
    "Terraform"     = "true",
    "security_zone" = "internal",
    "resource_role" = "internal",
    # 所属类型
    "owner_type" = "linux"
  }
}

# Sit环境linux默认安全组的默认入站规则
module "private_internal_SecGroup_Ingress_internal" {
  source = "../../../modules/security_group"

  cloud             = "aws"
  res_type          = "secGroupRule"
  ether_type        = "ingress"
  from_port         = 0
  to_port           = 65535
  protocol          = "all"
  cidr_blocks       = ["10.10.0.0/16"]
  description       = "Allow internal subnet"
  security_group_id = data.aws_security_group.Sit_private_linux_internal.id
}

# Sit环境linux默认的安全组中的默认出站规则
module "private_internal_SecGroup_Egress" {
  source = "../../../modules/security_group"

  cloud             = "aws"
  res_type          = "secGroupRule"
  ether_type        = "egress"
  from_port         = 0
  to_port           = 65535
  protocol          = "all"
  cidr_blocks       = ["0.0.0.0/0"]
  description       = "Default egress rule"
  security_group_id = data.aws_security_group.Sit_private_linux_internal.id
}

###############################################################################################
# Sit环境Windows默认安全组
module "Sit_private_internal_windows_SecGroup" {
  source = "../../../modules/security_group"

  cloud       = "aws"
  res_type    = "secGroup"
  name        = "Sit_private_internal_windows_SecGroup"
  description = "Sit VPC private windows security group"
  vpc_id      = data.aws_vpc.Sit.id

  tags = {
    "env"           = "Sit",
    "region"        = "ap-south-1",
    "owner"         = "SkyCloud",
    "Terraform"     = "true",
    "security_zone" = "internal",
    "resource_role" = "internal",
    # 所属类型
    "owner_type" = "windows"
  }
}

# Sit环境windows默认安全组的默认入站规则
module "private_internal_windows_SecGroup_Ingress_internal" {
  source = "../../../modules/security_group"

  cloud             = "aws"
  res_type          = "secGroupRule"
  ether_type        = "ingress"
  from_port         = 3389
  to_port           = 3389
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  description       = "Allow windows remote 3389 port"
  security_group_id = data.aws_security_group.Sit_private_windows_internal.id
}

# Sit环境windows默认的安全组中的默认出站规则
module "private_internal_windows_SecGroup_Egress" {
  source = "../../../modules/security_group"

  cloud             = "aws"
  res_type          = "secGroupRule"
  ether_type        = "egress"
  from_port         = 0
  to_port           = 65535
  protocol          = "all"
  cidr_blocks       = ["0.0.0.0/0"]
  description       = "Default windows egress rule"
  security_group_id = data.aws_security_group.Sit_private_windows_internal.id
}

###############################################################################################
# Sit环境middleware默认安全组
module "Sit_private_internal_middleware_SecGroup" {
  source = "../../../modules/security_group"

  cloud       = "aws"
  res_type    = "secGroup"
  name        = "Sit_private_internal_middleware_SecGroup"
  description = "Sit VPC private middleware security group"
  vpc_id      = data.aws_vpc.Sit.id

  tags = {
    "env"           = "Sit",
    "region"        = "ap-south-1",
    "owner"         = "SkyCloud",
    "Terraform"     = "true",
    "security_zone" = "internal",
    "resource_role" = "internal",
    # 所属类型
    "owner_type" = "middleware"
  }
}

# Sit环境middleware默认安全组的默认入站规则
module "private_internal_middleware_SecGroup_Ingress_internal" {
  source = "../../../modules/security_group"

  cloud             = "aws"
  res_type          = "secGroupRule"
  ether_type        = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  description       = "Allow middleware ssh 22 port"
  security_group_id = data.aws_security_group.Sit_private_middleware_internal.id
}

# Sit环境middleware默认的安全组中的默认出站规则
module "private_internal_middleware_SecGroup_Egress" {
  source = "../../../modules/security_group"

  cloud             = "aws"
  res_type          = "secGroupRule"
  ether_type        = "egress"
  from_port         = 0
  to_port           = 65535
  protocol          = "all"
  cidr_blocks       = ["0.0.0.0/0"]
  description       = "Default middleware egress rule"
  security_group_id = data.aws_security_group.Sit_private_middleware_internal.id
}

###############################################################################################
# Sit环境postgres默认安全组
module "Sit_private_internal_postgres_SecGroup" {
  source = "../../../modules/security_group"

  cloud       = "aws"
  res_type    = "secGroup"
  name        = "Sit_private_internal_postgres_SecGroup"
  description = "Sit VPC private postgres security group"
  vpc_id      = data.aws_vpc.Sit.id

  tags = {
    "env"           = "Sit",
    "region"        = "ap-south-1",
    "owner"         = "SkyCloud",
    "Terraform"     = "true",
    "security_zone" = "internal",
    "resource_role" = "internal",
    # 所属类型
    "owner_type" = "postgres"
  }
}

# Sit环境postgres默认安全组的默认入站规则
module "private_internal_postgres_SecGroup_Ingress_internal" {
  source = "../../../modules/security_group"

  cloud             = "aws"
  res_type          = "secGroupRule"
  ether_type        = "ingress"
  from_port         = 5432
  to_port           = 5432
  protocol          = "tcp"
  cidr_blocks       = ["10.10.0.0/16"]
  description       = "Allow Connect To Postgres Rule"
  security_group_id = data.aws_security_group.Sit_private_postgres_internal.id
}

# Sit环境postgres默认的安全组中的默认出站规则
module "private_internal_postgres_SecGroup_Egress" {
  source = "../../../modules/security_group"

  cloud             = "aws"
  res_type          = "secGroupRule"
  ether_type        = "egress"
  from_port         = 5432
  to_port           = 5432
  protocol          = "tcp"
  cidr_blocks       = ["10.10.0.0/16"]
  description       = "Default Postgres Egress Rule"
  security_group_id = data.aws_security_group.Sit_private_postgres_internal.id
}
