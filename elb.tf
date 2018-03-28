resource "aws_elb" "elb_ss" {
  count="${var.count}"
  name = "${terraform.env}-elb-ss"

  subnets = [
    "${data.aws_subnet.subnet-ss-a.id}",
    "${data.aws_subnet.subnet-ss-c.id}"
  ]

  security_groups = [
    "${aws_security_group.sg_ss_app.id}",
    "${data.aws_security_group.sg_ss_lan.id}"
  ]

  listener {
    instance_port = 3000
    instance_protocol = "http"
    lb_port = 80
    lb_protocol = "http"
  }

  health_check {
    healthy_threshold = 2
    unhealthy_threshold = 2
    timeout = 5
    target = "HTTP:3000/ping"
    interval = 30
  }

  instances = [
    "${aws_instance.ss_instance.id}"
  ]
  cross_zone_load_balancing = true
  idle_timeout = 400
  connection_draining = true
  connection_draining_timeout = 400

  tags {
    Environment = "${terraform.env}"
    Name = "${terraform.env}-elb-ss"
    Role = "ELB"
  }
}