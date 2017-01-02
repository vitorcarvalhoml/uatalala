# ec2

resource "aws_instance" "web" {
    ami = "${data.aws_ami.default_ami.id}"
    instance_type = "t2.micro"
    key_name = "${var.default_environment}"

    subnet_id = "${aws_subnet.subnet_1.id}"

    root_block_device {
      volume_type = "gp2"
    }

    tags {
        Name = "web"
        Environment = "${var.default_environment}"
    }
}