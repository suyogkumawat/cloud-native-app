resource "aws_security_group" "rds_sg" {
  name        = "vault-rds-sg"
  description = "Allow EKS Fargate to access RDS"
  vpc_id      = module.vpc.vpc_id
}

# Allow EKS cluster security group to connect to DB
resource "aws_vpc_security_group_ingress_rule" "eks_to_rds" {
  security_group_id = aws_security_group.rds_sg.id
  from_port         = 5432
  to_port           = 5432
  ip_protocol       = "tcp"
  referenced_security_group_id = module.eks.cluster_security_group_id
}

