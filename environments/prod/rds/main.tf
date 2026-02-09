terraform {
  required_version = ">= v1.6.6"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.31.0"
    }
  }
}

module "ProdPostgresRds" {
  source = "../../../modules/rds"

  cloud                       = "aws"
  res_type                    = "rds"
  db_name                     = "pkmonitorv3"
  username                    = "postgres"
  password                    = "z0jW}P44y_cJfsG"
  port                        = "3306"
  allocated_storage           = "200"
  max_allocated_storage       = 0
  allow_major_version_upgrade = false
  apply_immediately           = false
  auto_minor_version_upgrade  = false
  az                          = "ap-south-1a"
  # UTC 时间的 00:00 到 02:00 期间进行数据库备份
  backup_window           = "00:00-02:00"
  backup_retention_period = 7
  #  UTC 时间周四的凌晨 02:30 到 05:00 期间进行维护
  maintenance_window    = "thu:02:30-thu:05:00"
  copy_tags_to_snapshot = true
  # 指定子网组的名称
  db_subnet_group_name = "Prod_rds_subnets_group"
  # 删除前备份。true/false
  delete_automated_backups = false
  # 实例删除保护。true/false
  deletion_protection       = false
  engine                    = "postgres"
  engine_version            = "15.3"
  final_snapshot_identifier = "rds-snapshot"
  # 删除DB前是否创建快照。true/false。如果指定true，则不创建DBSnapshot。设置为false则使用final_snapshot_identifier的值作为快照名称
  skip_final_snapshot = true
  # RDS名称
  identifier = "Prod-postgres-rds"
  # instance_class            = "db.m5.xlarge"
  instance_class       = "db.m5d.large"
  multi_az             = false
  network_type         = "IPV4"
  parameter_group_name = "default.postgres15"
  option_group_name    = "default:postgres-15"
  publicly_accessible  = false
  storage_encrypted    = false
  storage_type         = "gp3"
  # 指定要关联的安全组列表
  vpc_security_group_ids = [local.secGroups["Prod_private_internal_postgres_SecGroup"]]

  tags = {
    "env"           = "Prod",
    "region"        = "ap-south-1",
    "owner"         = "SkyCloud",
    "Terraform"     = "true",
    "business_type" = "RDS",
    "security_zone" = "internal"
  }
}
