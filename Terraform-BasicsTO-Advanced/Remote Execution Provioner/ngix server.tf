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


# Give the key name of your key pair
resource "aws_instance" "ngix-ec2" {
    ami = "ami-0cca134ec43cf708f"
    instance_type = "t2.micro"
    key_name = "three-tier"

# User name will be the same
# file path make sure you keep the file in the same directory
# Security group should allow ssh from anywhere in port 22 and 80 for custom TCP
connection {
    type = "ssh"
    user = "ec2-user"
    private_key = file("./three-tier.pem")
    host = self.public_ip
    }

provisioner "remote-exec" {
    inline = [
        "sudo amazon-linux-extras install -y ngix",
        "sudo systemctl start ngix",
    ]
}

}
