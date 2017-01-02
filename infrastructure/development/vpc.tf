# vpc 

resource "aws_vpc" "vpc" {
  cidr_block = "${var.vpc}"

  tags {
    Name = "vpc | ${var.default_environment}"
    Environment = "${var.default_environment}"
  }
}

resource "aws_internet_gateway" "default_ig" {
  vpc_id = "${aws_vpc.vpc.id}"

  tags {
    Name = "internet gateway | ${var.default_environment}"
    Environment = "${var.default_environment}"
  }
}

resource "aws_subnet" "subnet_1" {
  vpc_id = "${aws_vpc.vpc.id}"
  cidr_block = "${var.subnet_1}"
  
  tags {
    Name = "subnet | ${var.default_environment}"
    Environment = "${var.default_environment}"
  }
}

# resource "aws_route_table" "default_rt" {
#   vpc_id = "${aws_vpc.vpc.id}"
#   route {
#     cidr_block = "${var.subnet_1}"
#     gateway_id = "${aws_internet_gateway.default_ig.id}"
#   }

#   tags {
#     Name = "route table | ${var.default_environment}"
#     Environment = "${var.default_environment}"
#   }
# }