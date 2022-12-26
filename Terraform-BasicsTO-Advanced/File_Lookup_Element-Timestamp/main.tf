locals {
    time = formatdate ("DD MM YYYY hh:mm zzz", timestamp())
}

variable "region" {
  type        = string
  default     = "ap-south-1"
}

variable "tags" {
  type        = list
  default     = ["firstec2", "secondec2"]
}

variable "ami" {
  type        = map
  default     = {
    eu-west-1 = ""
    eu-east-1 = ""
    eu-south-1 = ""
  }
}
 
resource "aws_key_pair" "login_key" {
    key_name = "login_key"
    public_key = file("$(path.module)/id_rsa.pub")
}

resource "aws_instance" "app-dev" {
    ami = lookup(var.ami,var.region)
    instance_type = "t2.micro"
    key_name = aws_key_pair.login_key.key_name
    count = 2
    tags = {
        name = element(var.tags,count.index)
    }
}


output timestamp {
  value = "local.time"
}
