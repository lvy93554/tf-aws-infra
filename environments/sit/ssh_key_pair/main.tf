module "upload_ssh_key_pair" {
  source = "../../../modules/ssh_key_pair"

  cloud             = "aws"
  res_type          = "key_pair"
  ssh_key_pair_name = "test-ssh-key"

  tags = {
    "env"           = "Sit",
    "owner"         = "SkyCloud",
    "business_type" = "ssh-key-pair",
    "Terraform"     = "true"
  }
}