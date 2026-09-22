data "aws_ami" "amzn" {
  most_recent = true

  filter {
    name   = "name"
    values = ["al2023-ami-2023.*-kernel-*-x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["amazon"]
}

resource "aws_instance" "this" {
  ami           = data.aws_ami.amzn.id
  instance_type = var.ec2_instance_type
  
}