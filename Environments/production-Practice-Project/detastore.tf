data "aws_ami" "NGINX" {
  executable_users = ["self"]
  #most_recent      = true
  #name_regex       = "^NGINX"
  owners           = ["ami-08db21e74b3846719"]

  filter {
    name   = "name"
    values = ["NGINX-2"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

output "ami_metadata" {
  value = data.aws_ami.NGINX
}
