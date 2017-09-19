data "aws_vpc" "vpc-ss" {
  tags {
    Name = "vpc-ss"
  }
}

data "aws_subnet" "subnet-ss-a" {
  tags {
    Name = "subnet-ss-a"
  }
}

data "aws_subnet" "subnet-ss-c" {
  tags {
    Name = "subnet-ss-c"
  }
}