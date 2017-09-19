resource "aws_security_group" "sg_ss_app" {
  name = "${terraform.env}-ss-app"
  vpc_id = "${data.aws_vpc.vpc-ss.id}"
  description = "for SS Network"

  ingress {
    from_port = 5432
    to_port = 5432
    protocol = "tcp"
    self = true
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


data "aws_security_group" "sg_ss_lan" {
  tags {
    Name = "sg_ss_lan"
  }
}