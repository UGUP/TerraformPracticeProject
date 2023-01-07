#Launch EC2 in Custome Private subnet 

module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  name = "EC2"
  ami                    = "ami-0a6b2839d44d781b2"
  instance_type          = var.instanceType
  key_name               = var.key
  monitoring             = true
  vpc_security_group_ids = [module.sg.vpc_security_group_ids]
  subnet_id              = module.wordpress-vpc.public_subnets[0]

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}