terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 4.0"
    }
  }
}
provider "aws" {
    region = "ap-south-1"
}
resource "aws_instance" "ngix-ec2" {
    ami = "ami-0cca134ec43cf708f"
    instance_type = "t2.micro"
}
