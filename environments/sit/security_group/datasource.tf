# VPC
data "aws_vpc" "Sit" {
  tags = {
    "Name" = "Sit"
  }
}

# linux
data "aws_security_group" "Sit_private_linux_internal" {
  name = "Sit_private_internal_linux_SecGroup"

  depends_on = [
    module.Sit_private_linux_internal_SecGroup
  ]
}

# windows
data "aws_security_group" "Sit_private_windows_internal" {
  name = "Sit_private_internal_windows_SecGroup"

  depends_on = [
    module.Sit_private_internal_windows_SecGroup
  ]
}

# middleware
data "aws_security_group" "Sit_private_middleware_internal" {
  name = "Sit_private_internal_middleware_SecGroup"

  depends_on = [
    module.Sit_private_internal_middleware_SecGroup
  ]
}

# postgres
data "aws_security_group" "Sit_private_postgres_internal" {
  name = "Sit_private_internal_postgres_SecGroup"

  depends_on = [
    module.Sit_private_internal_postgres_SecGroup
  ]
}
