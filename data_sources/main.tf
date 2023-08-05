data "aws_ami" "amis_devops" {
  name_regex       = "*Devops*"
  owners           = ["973714476881"]
}

output "amis" {
    value = data.aws_ami.amis_devops
}