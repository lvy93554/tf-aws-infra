# 过滤指定的ssh密钥对
data "aws_key_pair" "default_ssh_key_pair" {
  key_name           = "test-ssh-key"
  include_public_key = true

  filter {
    name   = "tag:business_type"
    values = ["ssh-key-pair"]
  }
}