#Launch EC2 in Custome Private subnet 

module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  name = "EC2"
  ami                    = data.aws_ami.NGINX
  instance_type          = var.instanceType
  key_name               = var.key
  monitoring             = true
  vpc_security_group_ids = module.vpc.default_security_group_id
  subnet_id              = module.vpc.private_subnets[0]

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}