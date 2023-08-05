resource "aws_instance" "frontend" {
  ami           = "ami-03265a0778a880afb"
  instance_type = "t3.micro"
  vpc_security_group_ids = ["sg-0490a4409ed09ba21"]

  tags = {
    Name = "frontend"
  }
}