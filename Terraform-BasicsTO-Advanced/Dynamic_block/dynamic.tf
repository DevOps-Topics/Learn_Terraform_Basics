
variable dynamic_demo {
  type        = string
  default     = "sg_ports"
}

variable sg_ports {
  type        = list
  default     = ["8000", "8200", "443", "22"]
}




resource "security_group" "allow_tls" {
    name = var.dynamic_demo
    dynamic "ingress" {
        for_each = var.sg_ports 
        content {
            from_port = ingress.value
            to_port = ingress.value
            protocol = "tls"
            cidr_blocks = ["0.0.0.0/0"]
        }
    }

    dynamic "egress" {
        for_each = var.sg_ports 
        content {
            from_port = ingress.value
            to_port = ingress.value
            protocol = "tls"
            cidr_blocks = ["0.0.0.0/0"]
        }
    }
}