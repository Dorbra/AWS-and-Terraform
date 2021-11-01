resource "aws_security_group" "ec2_instances_access" {
  vpc_id = var.vpc_id
  name   = "ec2-access"

  tags = {
    "Name" = "ec2-access-${var.vpc_id}"
  }
}

resource "aws_security_group_rule" "ec2_http_acess" {
  description       = "allow http access from anywhere"
  from_port         = 80
  protocol          = "tcp"
  security_group_id = aws_security_group.ec2_instances_access.id
  to_port           = 80
  type              = "ingress"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "ec2_ssh_acess" {
  description       = "allow ssh access from anywhere"
  from_port         = 22
  protocol          = "tcp"
  security_group_id = aws_security_group.ec2_instances_access.id
  to_port           = 22
  type              = "ingress"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "ec2_outbound_anywhere" {
  description       = "allow outbound traffic to anywhere"
  from_port         = 0
  protocol          = "-1"
  security_group_id = aws_security_group.ec2_instances_access.id
  to_port           = 0
  type              = "egress"
  cidr_blocks       = ["0.0.0.0/0"]
}
