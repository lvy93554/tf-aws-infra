locals {
  secGroups = {
    for i in data.aws_security_group.secGroup :
    i["name"] => i["id"]
  }
  vms = {
    for i in data.aws_instance.vm :
    i["tags"]["Name"] => i["id"]
  }
  disks = {
    for i in data.aws_ebs_volume.disk :
    i["tags"]["Name"] => i["id"]
  }
  subnets = {
    for i in data.aws_subnet.subnet :
    i["tags"]["Name"] => i["id"]
  }
}

data "aws_vpc" "Sit" {
  tags = {
    "Name" = "Sit"
  }
}

data "aws_subnets" "subnets" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.Sit.id]
  }
}

data "aws_subnet" "subnet" {
  for_each = toset(data.aws_subnets.subnets.ids)
  id       = each.value
}

data "aws_security_groups" "secGroups" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.Sit.id]
  }
}

data "aws_security_group" "secGroup" {
  for_each = toset(data.aws_security_groups.secGroups.ids)
  id       = each.value
}

data "aws_instances" "vms" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.Sit.id]
  }
  instance_state_names = ["running", "stopped", "shutting-down", "stopping"]
}

data "aws_instance" "vm" {
  count       = length(data.aws_instances.vms.ids)
  instance_id = data.aws_instances.vms.ids[count.index]
}

data "aws_ebs_volumes" "disks" {
  tags = {
    "env" = "Sit"
  }
}

data "aws_ebs_volume" "disk" {
  count = length(data.aws_ebs_volumes.disks.ids)

  filter {
    name   = "volume-id"
    values = [data.aws_ebs_volumes.disks.ids[count.index]]
  }
}
