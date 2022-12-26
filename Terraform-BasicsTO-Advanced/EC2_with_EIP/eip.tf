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
# This is known as resource block for creating a ec2 with deafult vpc

resource "aws_instance" "myec2" {
    ami = ""
    instance_type = "t2.micro"

    tags = {
        name = "myec2"
    }

}
#This is for eip creation
resource "aws_eip" "ec2_eip" {
    vpc = true
}

#This is for eip association with our myec2 created
resource "aws_eip_association" "eip_assoc" {
    instance_id = aws_instance.myec2.id
    allocation_id = aws_eip.ec2.eip.id
}
