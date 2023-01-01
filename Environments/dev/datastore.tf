# use already created ami id from AWS for NGINX 

data "aws_ami" "NGINX" {
  executable_users = ["self"]
  owners           = ["self"]

  filter {
    name   = "NGINX"
    values = ["NGINX*"]
  }

 
}