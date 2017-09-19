resource "aws_instance" "ss_instance" {
  # ECS-optimized AMI for us-east-1
  ami = "ami-4af5022c"
  subnet_id = "${data.aws_subnet.subnet-ss-a.id}"
  instance_type = "t2.micro"
  associate_public_ip_address = true
  vpc_security_group_ids = ["${aws_security_group.sg_ss_app.id}"]
}