#Launch EC2 in Custome Private subnet 

# module "ec2_instance" {
#   source  = "./modules/terraform-aws-ec2-instance"
#   name = "EC2"
#   ami                    = "ami-ebd02392"
#   instance_type          = "t2.micro"
#   key_name               = "user1"
#   monitoring             = true
#   vpc_security_group_ids = ["sg-12345678"]
#   subnet_id              = "subnet-eddcdzz4"

#   tags = {
#     Terraform   = "true"
#     Environment = "dev"
#   }
# }