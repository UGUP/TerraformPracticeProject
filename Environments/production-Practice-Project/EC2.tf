# EC2 terraform module 

#Launch EC2 in Custome Private subnet 

module "EC2_Practice-Project" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  name = "EC2"
  ami                    = "ami-0a6b2839d44d781b2"
  instance_type          = var.instanceType
  key_name               = var.key
  monitoring             = true
  vpc_security_group_ids = [module.VPC_PRACTICE_PROJECT.vpc_id]
  subnet_id              = module.VPC_PRACTICE_PROJECT.private_subnets[0]

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}