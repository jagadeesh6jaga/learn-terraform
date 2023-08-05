resource "aws_instance" "frontend" {
  ami           = "ami-03265a0778a880afb"
  instance_type = "t3.micro"
  vpc_security_group_ids = ["sg-0490a4409ed09ba21"]

  tags = {
    Name = "frontend"
  }
}

resource "aws_route53_record" "frontend" {
  zone_id = "Z0159157KZ467VQH413J"
  name    = "jdevops.online"
  type    = "A"
  ttl     = 300
  records = [aws_instance.frontend.private_ip]
}