# module "target_group_practice_project" {
#   source = "terraform-aws-modules/alb/aws"
#   version = "8.2.1"
#   name = "target-practice-project"

#   # Remove these arguments:
#   # port = 80
#   # protocol = "HTTP"

#   vpc_id = module.VPC_PRACTICE_PROJECT.vpc_id

#   # Use the target_groups argument instead of targets:
#   target_groups = [
#     {
#       id = module.EC2_Practice-Project.id
#       port = 80
#     }  
#   ]
# }


# # resource "aws_lb_target_group" "target_group_practice_project" {
# #   name     = "target_group_practice_project"
# #   port     = 80
# #   protocol = "HTTP"
# #   vpc_id   = module.VPC_PRACTICE_PROJECT.vpc_id

# # }
