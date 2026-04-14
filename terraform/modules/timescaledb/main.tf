resource "aws_db_instance" "timescaledb" {
  identifier = "orbital-db"

  engine         = "postgres"
  engine_version = "15"
  instance_class = "db.r6g.large"

  allocated_storage = 200

  username = "postgres"
  password = "password"

  multi_az = true
  storage_encrypted = true

  backup_retention_period = 14
}