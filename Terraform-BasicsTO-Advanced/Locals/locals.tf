locals {
  common_tags = {
    owner = "DevOps"
    service = "demo"
  }

  prod_tags ={
    owner = "IT Team"
    service = "hosting"
  }
}

resource "aws_instance" "app-dev" {
    ami = ""
    instance_type = "t2.micro"
    tags = local.common_tags
}

resource "aws_instance" "app-prod" {
    ami = ""
    instance_type = "t2.micro"
    tags = local.prod_tags
}
