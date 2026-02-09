variable "cloud" {
  type = string
}

variable "vpc_name" {
  default = ""
  type    = string
}

variable "vpc_cidr" {
  default = ""
  type    = string
}

variable "tags" {
  default = {}
  type    = map(string)
}

variable "subnet_name" {
  default = ""
  type    = string
}

variable "az_name" {
  default = ""
  type    = string
}

variable "subnet_cidr" {
  default = ""
  type    = string
}

variable "description" {
  default = ""
  type    = string
}

variable "vpc_id" {
  default = ""
  type    = string
}

variable "res_type" {
  type = string
}

variable "auto_assign_public_ip" {
  default     = false
  type        = bool
}
