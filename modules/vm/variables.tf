variable "cloud" {
  type = string
}

variable "res_type" {
  type = string
}

variable "name" {
  default     = ""
  type        = string
}

variable "instance_spec" {
  default     = ""
  type        = string

}

variable "cpu_count" {
  default = ""
  type    = string
}

variable "image_id" {
  default = ""
  type    = string
}

variable "memory_size" {
  default = ""
  type    = string
}

variable "admin_pass" {
  default = ""
  type    = string
}

variable "az" {
  default = ""
  type    = string
}

variable "description" {
  default = ""
  type    = string
}

variable "vm_type" {
  default = ""
  type    = string
}

variable "root_disk_size" {
  default = 40
  type    = number
}

variable "root_disk_type" {
  default = ""
  type    = string
}

variable "root_iops" {
  default = 0
  type    = number
}

variable "security_groups" {
  default = []
  type    = list(string)
}

variable "subnet_id" {
  default = ""
  type    = string
}

variable "tags" {
  default = {}
  type    = map(string)
}

variable "disks" {
  default = []
  type    = list(map(string))
}

variable "disk_size" {
  default = ""
  type    = string
}

variable "disk_type" {
  default = ""
  type    = string
}

variable "disk_iops" {
  default = 0
  type    = number
}

variable "disk_throughput" {
  default = 150
  type    = number
}

variable "auto_snapshot_policy_id" {
  default = ""
  type    = string
}

variable "repeat_weekdays" {
  default = []
  type    = list(number)
}

variable "retention_days" {
  default = 7
  type    = number
}

variable "time_points" {
  default = []
  type    = list(number)
}

variable "disk_id" {
  default = ""
  type    = string
}

variable "instance_id" {
  default = ""
  type    = string
}

variable "device_name" {
  default = ""
  type    = string
}

variable "iam_instance_profile" {
  default = ""
  type    = string
}

variable "server_group" {
  default = ""
  type    = string
}

variable "cron" {
  default = ""
  type    = string
}

variable "retain_count" {
  default = 0
  type    = number
}

variable "tags_to_add" {
  default = {}
  type    = map(string)
}

variable "target_tags" {
  default = {}
  type    = map(string)
}

variable "dlm_resource_types" {
  default = []
  type    = list(string)
}

variable "execution_role_arn" {
  default = ""
  type    = string
}

variable "ssh_key_name" {
  default     = ""
  type        = string
}
