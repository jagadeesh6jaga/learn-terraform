data "aws_ami" "amis_devops" {
  most_recent      = true
  owners           = ["973714476881"]
}

output "amis" {
    value = data.aws_ami.amis_devops
}