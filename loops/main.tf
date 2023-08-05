variable "ami"{
    default = "ami-03265a0778a880afb"
}
variable "instance_type"{
    default = "t3.micro"
}

variable "security_group"{
    default = ["sg-0490a4409ed09ba21"]
}
variable "zone_id"{
    default = "Z0159157KZ467VQH413J"
}

variable "components_dict"{
    default = {
    "frontend" = {},
    "mongo" ={},
    "catalogue" ={}
    }
}

resource "aws_instance" instance123 {
    for_each = var.components_dict
    ami = var.ami
    instance_type = var.instance_type
    vpc_security_group_ids = var.security_group

    tags = {
        Name = each.key
    }
}

resource "aws_route53_record" "record"{
  for_each = var.components_dict
  zone_id = var.zone_id
  name    = "${each.key}.jdevops.online"
  type    = "A"
  ttl     = 300
  records = ["aws_instance.instance123[${each.key}].private_ip"]
}