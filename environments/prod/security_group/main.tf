terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.31.0"
    }
  }
}

# Prod环境linux默认的安全组
module "Prod_private_linux_internal_SecGroup" {
  source = "../../../modules/security_group"

  cloud       = "aws"
  res_type    = "secGroup"
  name        = "Prod_private_internal_linux_SecGroup"
  description = "Prod VPC private linux security group"
  vpc_id      = data.aws_vpc.Prod.id

  tags = {
    "env"           = "Prod",
    "region"        = "ap-south-1",
    "owner"         = "SkyCloud",
    "Terraform"     = "true",
    "security_zone" = "internal",
    "resource_role" = "internal",
    # 所属类型
    "owner_type" = "linux"
  }
}

# Prod环境linux默认安全组的默认入站规则
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
  security_group_id = data.aws_security_group.Prod_private_linux_internal.id
}

# Prod环境linux默认的安全组中的默认出站规则
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
  security_group_id = data.aws_security_group.Prod_private_linux_internal.id
}

###############################################################################################
# Prod环境Windows默认安全组
module "Prod_private_internal_windows_SecGroup" {
  source = "../../../modules/security_group"

  cloud       = "aws"
  res_type    = "secGroup"
  name        = "Prod_private_internal_windows_SecGroup"
  description = "Prod VPC private windows security group"
  vpc_id      = data.aws_vpc.Prod.id

  tags = {
    "env"           = "Prod",
    "region"        = "ap-south-1",
    "owner"         = "SkyCloud",
    "Terraform"     = "true",
    "security_zone" = "internal",
    "resource_role" = "internal",
    # 所属类型
    "owner_type" = "windows"
  }
}

# Prod环境windows默认安全组的默认入站规则
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
  security_group_id = data.aws_security_group.Prod_private_windows_internal.id
}

# Prod环境windows默认的安全组中的默认出站规则
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
  security_group_id = data.aws_security_group.Prod_private_windows_internal.id
}

###############################################################################################
# Prod环境middleware默认安全组
module "Prod_private_internal_middleware_SecGroup" {
  source = "../../../modules/security_group"

  cloud       = "aws"
  res_type    = "secGroup"
  name        = "Prod_private_internal_middleware_SecGroup"
  description = "Prod VPC private middleware security group"
  vpc_id      = data.aws_vpc.Prod.id

  tags = {
    "env"           = "Prod",
    "region"        = "ap-south-1",
    "owner"         = "SkyCloud",
    "Terraform"     = "true",
    "security_zone" = "internal",
    "resource_role" = "internal",
    # 所属类型
    "owner_type" = "middleware"
  }
}

# Prod环境middleware默认安全组的默认入站规则
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
  security_group_id = data.aws_security_group.Prod_private_middleware_internal.id
}

# Prod环境middleware默认的安全组中的默认出站规则
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
  security_group_id = data.aws_security_group.Prod_private_middleware_internal.id
}

###############################################################################################
# Prod环境postgres默认安全组
module "Prod_private_internal_postgres_SecGroup" {
  source = "../../../modules/security_group"

  cloud       = "aws"
  res_type    = "secGroup"
  name        = "Prod_private_internal_postgres_SecGroup"
  description = "Prod VPC private postgres security group"
  vpc_id      = data.aws_vpc.Prod.id

  tags = {
    "env"           = "Prod",
    "region"        = "ap-south-1",
    "owner"         = "SkyCloud",
    "Terraform"     = "true",
    "security_zone" = "internal",
    "resource_role" = "internal",
    # 所属类型
    "owner_type" = "postgres"
  }
}

# Prod环境postgres默认安全组的默认入站规则
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
  security_group_id = data.aws_security_group.Prod_private_postgres_internal.id
}

# Prod环境postgres默认的安全组中的默认出站规则
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
  security_group_id = data.aws_security_group.Prod_private_postgres_internal.id
}
