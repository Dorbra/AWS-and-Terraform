resource "aws_elb" "web-lb" {
  name = "nginx-elb"

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  subnets      = [aws_subnet.pub_1.id, aws_subnet.pub_2.id]
  instances    = [aws_instance.web1.id, aws_instance.web2.id]
  idle_timeout = 500

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:80/"
    interval            = 30
  }

  tags = {
    Name = "nginx-elb"
  }
}