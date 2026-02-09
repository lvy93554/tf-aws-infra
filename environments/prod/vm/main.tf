terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.31.0"
    }
  }
}

module "test_vm" {
  source = "../../../modules/vm"

  cloud          = "aws"
  res_type       = "vm"
  name           = "test-ubuntu"
  image_id       = "ami-03f4878755434977f"
  az             = "ap-south-1a"
  instance_spec  = "t3.xlarge"
  ssh_key_name   = "test-rsa"
  root_disk_size = "80"
  root_disk_type = "gp3"
  root_iops      = "3000"
  # 填写安全组的name的名称
  security_groups = [local.secGroups["Prod_private_internal_linux_SecGroup"]]
  # 填写subnet_name名称
  subnet_id = local.subnets["Prod_dmz_public_1a"]
  #   iam_instance_profile = "MySessionManagerRole"
  description = "Compute Ubuntu Server"

  tags = {
    "env"           = "Prod",
    "region"        = "ap-south-1",
    "az"            = "ap-south-1a",
    "owner"         = "SkyCloud",
    "Terraform"     = "true",
    "resource_role" = "ubuntu",
    "security_zone" = "dmz"
  }
}

module "test_windows_vm" {
  source = "../../../modules/vm"

  cloud           = "aws"
  res_type        = "vm"
  name            = "test-windows"
  image_id        = "ami-0ecdd20ff07e019ed"
  az              = "ap-south-1a"
  instance_spec   = "t3.xlarge"
  ssh_key_name    = "test-rsa"
  root_disk_size  = "80"
  root_disk_type  = "gp3"
  root_iops       = "3000"
  security_groups = [local.secGroups["Prod_private_internal_windows_SecGroup"]]
  subnet_id       = local.subnets["Prod_dmz_public_1a"]
  #   iam_instance_profile = "MySessionManagerRole"
  description = "Compute Ubuntu Server"

  tags = {
    "env"           = "Prod",
    "region"        = "ap-south-1",
    "az"            = "ap-south-1a",
    "owner"         = "SkyCloud",
    "Terraform"     = "true",
    "resource_role" = "windows",
    "security_zone" = "dmz"
  }
}
