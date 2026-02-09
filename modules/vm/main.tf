terraform {
  required_version = ">= v1.6.6"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.31.0"
    }
  }
}


resource "aws_instance" "vm" {
  count = var.cloud == "aws" && var.res_type == "vm" ? 1 : 0

  ami                    = var.image_id
  availability_zone      = var.az
  instance_type          = var.instance_spec
  key_name               = var.ssh_key_name
  vpc_security_group_ids = var.security_groups
  subnet_id              = var.subnet_id
  iam_instance_profile   = var.iam_instance_profile
  private_dns_name_options {
    enable_resource_name_dns_a_record = true
  }
  root_block_device {
    volume_size = var.root_disk_size != 40 ? var.root_disk_size : 40
    volume_type = var.root_disk_type != "gp2" && var.root_disk_type != "" ? var.root_disk_type : "gp3"
    iops        = var.root_iops != 0 ? var.root_iops : null
    tags = {
      "Name"        = var.name,
      "az"          = var.az,
      "type"        = "root",
      "description" = var.description
    }
  }

  tags = merge(
    var.tags,
    {
      "Name"        = var.name
      "description" = var.description
    }
  )
}


resource "aws_ebs_volume" "disk" {
  count = var.cloud == "aws" && var.res_type == "disk" ? 1 : 0

  availability_zone = var.az
  size              = var.disk_size
  type              = var.disk_type != "sc1" ? var.disk_type : "sc1"
  iops              = var.disk_iops != 0 && var.disk_type != "sc1" ? var.disk_iops : null
  throughput = var.disk_type != "gp3" ? null : var.disk_throughput

  tags = merge(
    var.tags,
    {
      "Name"        = var.name,
      "description" = var.description,
      "type"        = "data"
    }
  )
}


resource "aws_volume_attachment" "diskAtt" {
  count = var.cloud == "aws" && var.res_type == "diskAtt" ? 1 : 0

  device_name = var.device_name
  instance_id = var.instance_id
  volume_id   = var.disk_id
}
