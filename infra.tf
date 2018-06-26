terraform {
  required_version = ">= 0.11.2"
}

provider "aws" {
  region     = "eu-west-1"
  profile    = "private"
  version    = "~> 1.24"
}

resource "aws_route53_zone" "main" {
  name = "dominikpiatek.com"
}

resource "aws_route53_record" "root" {
  zone_id = "${aws_route53_zone.main.zone_id}"
  name    = "dominikpiatek.com"
  type    = "A"
  ttl     = "30"
  records = ["${aws_instance.blog.public_ip}"]
}

resource "aws_security_group" "blog" {
	ingress {
		from_port = 80
		to_port = 80
		protocol = "tcp"
		cidr_blocks = ["0.0.0.0/0"]
	}

  ingress {
		from_port = 443
		to_port = 443
		protocol = "tcp"
		cidr_blocks = ["0.0.0.0/0"]
	}

  ingress {
		from_port = 22
		to_port = 22
		protocol = "tcp"
		cidr_blocks = ["0.0.0.0/0"]
	}

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    ipv6_cidr_blocks = ["::/0"]
  }

}

resource "aws_key_pair" "blog" {
  key_name   = "blog"
  public_key = "${file("blog.pub")}"
}

resource "aws_instance" "blog" {
  ami           = "ami-58d7e821"
  instance_type = "t2.micro"
  key_name      = "${aws_key_pair.blog.id}"
  security_groups = ["${aws_security_group.blog.name}"]

	tags {
		Name = "ghost-blog"
	}
}

output "public_dns" {
  value = "${aws_instance.blog.public_dns}"
}
