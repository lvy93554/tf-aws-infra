terraform {
  required_version = ">= v1.6.6"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.31.0"
    }
  }
}


resource "aws_db_instance" "rds" {
  count = var.cloud == "aws" && var.res_type == "rds" ? 1 : 0

  db_name                     = var.db_name
  username                    = var.username
  password                    = var.password
  port                        = var.port
  allocated_storage           = var.allocated_storage
  max_allocated_storage       = var.max_allocated_storage
  allow_major_version_upgrade = var.allow_major_version_upgrade
  apply_immediately           = var.apply_immediately
  auto_minor_version_upgrade  = var.auto_minor_version_upgrade
  availability_zone           = var.az
  backup_retention_period     = var.backup_retention_period
  backup_window               = var.backup_window
  maintenance_window          = var.maintenance_window
  copy_tags_to_snapshot       = var.copy_tags_to_snapshot
  db_subnet_group_name        = var.db_subnet_group_name
  delete_automated_backups    = var.delete_automated_backups
  deletion_protection         = var.deletion_protection
  engine                      = var.engine
  engine_version              = var.engine_version
  final_snapshot_identifier   = var.final_snapshot_identifier
  skip_final_snapshot         = var.skip_final_snapshot
  identifier                  = var.identifier
  instance_class              = var.instance_class
  multi_az                    = var.multi_az
  network_type                = var.network_type
  option_group_name           = var.option_group_name
  parameter_group_name        = var.parameter_group_name
  publicly_accessible         = var.publicly_accessible
  storage_encrypted           = var.storage_encrypted
  storage_type                = var.storage_type
  vpc_security_group_ids      = var.vpc_security_group_ids

  tags = merge(
    var.tags,
    {
      "Name"        = var.identifier
      "description" = var.description
    }
  )
}