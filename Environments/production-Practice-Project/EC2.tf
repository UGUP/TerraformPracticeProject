# EC2 terraform module 

#Launch EC2 in Custome Private subnet 

module "EC2_Practice-Project" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  name = "EC2"
  ami                    = data.aws_ami.NGINX
  instance_type          = var.instanceType
  key_name               = var.key
  monitoring             = true
  vpc_security_group_ids = [module.SG_PRACTICE_PROJECT.security_group_id]
  subnet_id              = module.VPC_PRACTICE_PROJECT.private_subnets[0]

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}