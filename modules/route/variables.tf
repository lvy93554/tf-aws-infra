variable "cloud" {
  type = string
}

variable "res_type" {
  default = ""
  type    = string
}

variable "route_table_id" {
  default = ""
  type    = string
}

variable "source_address" {
  default = ""
  type    = string
}

variable "destination_address" {
  default = ""
  type    = string
}

variable "next_hop_id" {
  default = ""
  type    = string
}

variable "next_hop_type" {
  default = ""
  type    = string
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

variable "vpc_peering_connection_id" {
  default = ""
  type    = string
}

variable "nat_gateway_id" {
  default = ""
  type    = string
}

variable "gateway_id" {
  default = ""
  type    = string
}

variable "subnet_id" {
  default = ""
  type    = string
}

variable "tags" {
  default = {}
  type    = map(string)
}

variable "transit_gateway_id" {
  default = ""
  type    = string
}