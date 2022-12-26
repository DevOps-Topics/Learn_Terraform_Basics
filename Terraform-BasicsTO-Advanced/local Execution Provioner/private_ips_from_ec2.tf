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

/* This local-exec provisioner allows you to run a command on the computer that you run terraform apply from
locally after it has been created . The following command will create a file private ips.txt 
 with private ip of ec2 created */

resource "aws_instance" "ngix-ec2" {
    ami = "ami-0cca134ec43cf708f"
    instance_type = "t2.micro"
provisioner "local-exec" {
    command = "echo ${aws_instance.ngix.ec2.private_ip}" > private_ips.txt
}
}
