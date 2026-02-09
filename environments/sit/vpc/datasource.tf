data "aws_vpc" "Sit" {
  tags = {
    "Name" = "Sit"
  }

  depends_on = [module.Sit_vpc]
}