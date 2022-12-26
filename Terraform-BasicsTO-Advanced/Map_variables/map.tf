resource "aws_insatnce" "myec2" {
    ami = ""
    instance_type = var.ec2_type["ap-south-1"]
}

variable ec2_type {
  type        = map
  default     = {
    us-east-1 = "t2.nano"
    us-east-1 = "t2.large"
    ap-south-1 = "t2.micro"
}
