variable "ami"{
    default = "ami-03265a0778a880afb"
}
variable "instance_type"{
    default = "t3.micro"
}

variable "security_group"{
    default = ["sg-0490a4409ed09ba21"]
}


variable "inastance_name"{
    default = "frontend"
}

resource "aws_instance" var.inastance_name {
  ami           = var.ami
  instance_type = var.instance_type
  vpc_security_group_ids = var.security_group

  tags = {
    Name = var.inastance_name
  }
}

resource "aws_route53_record" "frontend" {
  zone_id = "Z0159157KZ467VQH413J"
  name    = "jdevops.online"
  type    = "A"
  ttl     = 300
  records = [aws_instance.frontend.private_ip]
}