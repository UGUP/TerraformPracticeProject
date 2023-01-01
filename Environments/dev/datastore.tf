# use already created ami id from AWS for NGINX 

data "aws_ami" "NGINX" {
  executable_users = ["self"]
  owners           = ["017706783036"]

  filter {
    name   = "name"
    values = ["NGINX*"]
  }

 
}