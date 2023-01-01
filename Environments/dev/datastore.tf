# use already created ami id from AWS for NGINX 

data "aws_ami" "NGINX" {
  executable_users = ["self"]
  owners           = ["017706783036"]

  filter {
    name   = "name"
    values = ["NGINX"]
  }

  filter {
      name   = "architecture"
      values = ["x86_64"]
  }

  filter {
      name   = "root-device-type"
      values = ["EBS"]
  }
}

 
