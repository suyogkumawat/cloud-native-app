module "rds" {
  source  = "terraform-aws-modules/rds/aws"
  version = "~> 6.4"

  identifier = "vault-postgres-db"

  engine               = "postgres"
  engine_version       = "16.6"
  family               = "postgres16"
  instance_class       = "db.t3.micro"
  allocated_storage    = 20

  create_db_subnet_group = true

  db_name  = var.db_name
  username = var.db_username
  password = var.db_password

  port = 5432

  multi_az               = false
  publicly_accessible    = false

  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  subnet_ids             = module.vpc.private_subnets
  skip_final_snapshot = true

  tags = {
    Name = "vault-rds"
  }
}

