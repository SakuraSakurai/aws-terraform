resource "aws_db_instance" "rds_ss" {
  count="${var.count}"
  identifier = "${terraform.env}-rds-ss"
  allocated_storage = 5
  engine = "postgres"
  engine_version = "9.6.2"
  instance_class = "db.t2.micro"
  name = "ss_rds"
  username = "ss_rds"
  password = "${var.ss_rds_password}"
  db_subnet_group_name = "${aws_db_subnet_group.rds_ss.name}"
  vpc_security_group_ids = ["${aws_security_group.sg_ss_app.id}"]
  # default parameter_group_name = "${aws_db_parameter_group.db-pg.name}"
  multi_az = false
  backup_window = "19:00-19:30"
}

output "rds_endpoint" {
  value = "${aws_db_instance.rds_ss.address}"
}


resource "aws_db_subnet_group" "rds_ss" {
  count="${var.count}"
  name = "${terraform.env}-rds-ss"
  description = "rds subnet group for ss"
  subnet_ids = ["${data.aws_subnet.subnet-ss-a.id}","${data.aws_subnet.subnet-ss-c.id}"]
  tags {
    Name = "${terraform.env}-rds-ss"
  }
}