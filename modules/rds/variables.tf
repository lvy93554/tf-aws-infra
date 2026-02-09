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

variable "allocated_storage" {
  default = 10
  type    = number
}

variable "allow_major_version_upgrade" {
  default = false
  type    = bool
}

variable "apply_immediately" {
  default = false
  type    = bool
}

variable "auto_minor_version_upgrade" {
  default = false
  type    = bool
}

variable "az" {
  default = ""
  type    = string
}

variable "backup_retention_period" {
  default = 7
  type    = number
}

variable "backup_window" {
  default = "00:00-02:00"
  type    = string
}

variable "copy_tags_to_snapshot" {
  default = true
  type    = bool
}

variable "db_name" {
  default = ""
  type    = string
}

variable "db_subnet_group_name" {
  default = ""
  type    = string
}

variable "delete_automated_backups" {
  default = true
  type    = bool
}

variable "deletion_protection" {
  default     = true
  type        = bool
}

variable "engine" {
  default     = ""
  type        = string
}

variable "engine_version" {
  default     = ""
  type        = string
}

variable "final_snapshot_identifier" {
  default = "rds-snapshot"
  type    = string
}

variable "identifier" {
  default = "rds"
  type    = string
}

variable "instance_class" {
  default     = ""
  type        = string
}

variable "maintenance_window" {
  default = "thu:02:30-thu:04:00"
  type    = string
}

variable "max_allocated_storage" {
  default = 0
  type    = number
}

variable "multi_az" {
  default = false
  type    = bool
}

variable "network_type" {
  default = "IPV4"
  type    = string
}

variable "option_group_name" {
  default = ""
  type    = string
}

variable "parameter_group_name" {
  default = ""
  type    = string
}

variable "username" {
  default = ""
  type    = string
}

variable "password" {
  default   = ""
  type      = string
  sensitive = true
}

variable "port" {
  default = 3306
  type    = number
}

variable "publicly_accessible" {
  default = false
  type    = bool
}

variable "skip_final_snapshot" {
  default = false
  type    = bool
}

variable "storage_encrypted" {
  default = false
  type    = bool
}

variable "storage_type" {
  default = "io1"
  type    = string
}

variable "vpc_security_group_ids" {
  default = []
  type    = list(string)
}
