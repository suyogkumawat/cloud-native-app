output "eks_cluster_name" {
  value = module.eks.cluster_name
}

output "eks_cluster_endpoint" {
  value = module.eks.cluster_endpoint
}

output "oidc_provider" {
  value = module.eks.oidc_provider
}

output "rds_endpoint" {
  value = module.rds.db_instance_endpoint
}

output "rds_port" {
  value = module.rds.db_instance_port
}

