# VPC
data "aws_vpc" "Prod" {
  tags = {
    "Name" = "Prod"
  }
}

# linux
data "aws_security_group" "Prod_private_linux_internal" {
  name = "Prod_private_internal_linux_SecGroup"

  depends_on = [
    module.Prod_private_linux_internal_SecGroup
  ]
}

# windows
data "aws_security_group" "Prod_private_windows_internal" {
  name = "Prod_private_internal_windows_SecGroup"

  depends_on = [
    module.Prod_private_internal_windows_SecGroup
  ]
}

# middleware
data "aws_security_group" "Prod_private_middleware_internal" {
  name = "Prod_private_internal_middleware_SecGroup"

  depends_on = [
    module.Prod_private_internal_middleware_SecGroup
  ]
}

# postgres
data "aws_security_group" "Prod_private_postgres_internal" {
  name = "Prod_private_internal_postgres_SecGroup"

  depends_on = [
    module.Prod_private_internal_postgres_SecGroup
  ]
}
