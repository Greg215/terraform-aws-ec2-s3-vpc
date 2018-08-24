data "aws_ami" "server_ami" {
  most_recent = true

  filter {
    name   = "owner-alias"
    values = ["amazon"]
  }

  filter {
    name   = "name"
    values = ["amzn-ami-hvm*-x86_64-gp2"]
  }
}

resource "aws_key_pair" "tf_auth" {
  key_name   = "${var.key_name}"
  public_key = "${file(var.public_key_path)}"
}

data "template_file" "user-init" {
  count    = 6
  template = "${file("${path.module}/userdata.tpl")}"

  vars {
    firewall_subnets = "${element(var.subnet_ips, count.index)}"
  }
}

resource "aws_instance" "tf_server" {
<<<<<<< HEAD
  count         = "${var.instance_count}"
  instance_type = "${var.instance_type}"
  ami           = "${data.aws_ami.server_ami.id}"
=======
    count = "${var.instance_count}"
    instance_type = "${var.instance_type}"
    ami = "${data.aws_ami.server_ami.id}"
    tags {
       Name = "tf_server-${count.index+1}"
    }
    key_name = "${aws_key_pair.tf_auth.id}"
    vpc_security_group_ids = ["${var.security_group}"]
    subnet_id = "${element(var.subnets, count.index)}"
    user_data = "${data.template_file.user-init.*.rendered[count.index]}"
}
>>>>>>> a0983ebafb28afb00a1de17ace4e115608ae99f4

  tags {
    Name = "tf_server_gregTest-${count.index+1}"
  }

  key_name               = "${aws_key_pair.tf_auth.id}"
  vpc_security_group_ids = ["${var.security_group}"]
  subnet_id              = "${element(var.subnets, count.index)}"
  user_data              = "${data.template_file.user-init.*.rendered[count.index]}"
}
