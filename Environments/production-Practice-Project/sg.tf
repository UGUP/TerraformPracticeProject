module "SG_PRACTICE_PROJECT" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "ssh"
  description = "Security group for user-service with custom ports open within VPC, and mysql publicly open"
  vpc_id      = module.VPC_PRACTICE_PROJECT.vpc_id

  ingress_cidr_blocks      = ["100.10.0.0/16"]
  ingress_with_cidr_blocks = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      description = "ssh"
      cidr_blocks = "0.0.0.0/0"
    },
    {
      rule        = "mysql-tcp"
      cidr_blocks = "0.0.0.0/0"
    },
  ]
  egress_rules = [ "all-all"]
}