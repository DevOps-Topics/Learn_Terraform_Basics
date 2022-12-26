terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 4.0"
    }
  }
}

#this is know as provider block where you can make provider confiuration

provider "aws" {
    region = "ap-south-1"
}

resource "aws_security_group" "var_demo" {
    ingress {
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = [var.var_ip]
    }
    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = [var.var_ip]
    }
}

variable  "var_ip" {
    default = "192.168.0.0/24"
}
