module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.8"

  cluster_name    = var.cluster_name
  cluster_version = "1.29"

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  enable_irsa = true

  fargate_profiles = {
    kube-system = {
      name = "kube-system"
      selectors = [
        { namespace = "kube-system" }
      ]
    }
    app = {
      name = "app"
      selectors = [
        { namespace = "app" }
      ]
    }
    vault = {
      name = "vault"
      selectors = [
        { namespace = "vault" }
      ]
    }
  }

  cluster_addons = {
    coredns = {
      addon_version = "v1.11.4-eksbuild.22"
      preserve = true  # <<< FIX
    }
    kube-proxy = {
      most_recent = true
      preserve = true
    }
    vpc-cni = {
      most_recent = true
      preserve = true
    }
  }
}

