module "sg" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "ssh"
  description = "Security group for user-service with custom ports open within VPC, and mysql publicly open"
  vpc_id      = module.wordpress-vpc

  ingress_cidr_blocks      = ["10.10.0.0/16"]
  ingress_with_cidr_blocks = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      description = "ssh"
      cidr_blocks = "10.10.0.0/16"
    },
    {
      rule        = "mysql-tcp"
      cidr_blocks = "0.0.0.0/0"
    },
  ]
}