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

variable "vpc_id" {
  default = ""
  type    = string
}

variable "tags" {
  default = {}
  type    = map(string)
}

variable "security_group_id" {
  default = ""
  type    = string
}

variable "dest_group_id" {
  default = ""
  type    = string
}

variable "dest_ip" {
  default = ""
  type    = string
}

variable "ip_type" {
  default = ""
  type    = string
}

variable "ether_type" {
  default = ""
  type    = string
}

variable "port_range" {
  default = ""
  type    = string
}

variable "protocol" {
  default = ""
  type    = string
}

variable "source_group_id" {
  default = ""
  type    = string
}

variable "source_ip" {
  default = ""
  type    = string
}

variable "from_port" {
  default = 0
  type    = number
}

variable "to_port" {
  default = 0
  type    = number
}

variable "cidr_blocks" {
  default = []
  type    = list(string)
}
