variable "cloud" {
  default = ""
  type    = string
}

variable "res_type" {
  default = ""
  type    = string
}

variable "ssh_key_pair_name" {
  default  = ""
  type     = string
  nullable = false
}

variable "ssh_public_key_path" {
  default     = "~/.ssh/id_rsa.pub"
}

variable "description" {
  default = ""
  type    = string
}

variable "tags" {
  default = {}
  type    = map(string)
}