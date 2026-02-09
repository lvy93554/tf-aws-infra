variable "cloud" {
  type = string
}

variable "res_type" {
  type = string
}

variable "name" {
  default = ""
  type    = string
}

variable "description" {
  default = ""
  type    = string
}

variable "subnets" {
  default = []
  type    = list(string)
}

variable "tags" {
  default = {}
  type    = map(string)
}