module "target_group" {
  source = "terraform-aws-modules/alb/aws"
  version = "8.2.1"
  name = "target-practice-project"
  port = 80
  protocol = "HTTP"
  vpc_id = module.VPC_PRACTICE_PROJECT.vpc_id
  targets = [
    {
      id = module.EC2_Practice-Project.id
      port = 80
    }  
  ]
}
