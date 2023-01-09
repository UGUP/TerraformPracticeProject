module "target_group" {
  source = "terraform-aws-modules/alb/aws"
  version = "2.10.0"
  name = "target-practice-project"
  port = 80
  protocol = "HTTP"
  vpc_id = "vpc-123456"
  targets = [
    {
      id = module.EC2_Practice-Project.id
      port = 80
    }
   
  ]
}
