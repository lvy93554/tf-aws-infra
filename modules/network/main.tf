terraform {
  required_version = ">= v1.6.6"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.31.0"
    }
  }
}

resource "aws_nat_gateway" "natGateway" {
  count = var.cloud == "aws" && var.res_type == "natGateway" ? 1 : 0

  # NAT 网关的连接类型。有效值为private和public。默认为public
  connectivity_type = var.connectivity_type
  # NAT 网关的弹性 IP 地址的分配 ID
  allocation_id = var.connectivity_type == "public" ? var.allocation_id : null
  # NAT 网关的子网 ID
  subnet_id = var.subnet_id

  tags = merge(
    var.tags,
    {
      "Name"        = var.natGateway_name
      "description" = var.description
    }
  )
}

resource "aws_eip" "eip" {
  count = var.cloud == "aws" && var.res_type == "eip" ? 1 : 0

  tags = merge(
    var.tags,
    {
      "Name"        = var.eip_name
      "description" = var.description
    }
  )
}

# 提供 AWS EIP 关联作为顶级资源，以将弹性 IP 与 AWS 实例和网络接口关联和取消关联
resource "aws_eip_association" "eipAss" {
  count = var.cloud == "aws" && var.res_type == "eipAss" ? 1 : 0

  allocation_id = var.allocation_id
  instance_id   = var.instance_id
}

# 用于创建 VPC Internet 网关(互联网网关)的资源
resource "aws_internet_gateway" "internetGateway" {
  count = var.cloud == "aws" && var.res_type == "internetGateway" ? 1 : 0

  tags = merge(
    var.tags,
    {
      "Name"        = var.internetGateway_name
      "description" = var.description
    }
  )
}

# 用于创建 VPC Internet 网关(互联网网关)附件的资源
resource "aws_internet_gateway_attachment" "internetGatewayAtt" {
  count = var.cloud == "aws" && var.res_type == "internetGatewayAtt" ? 1 : 0

  internet_gateway_id = var.internetGatewayId
  vpc_id              = var.vpc_id
}
