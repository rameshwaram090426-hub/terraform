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
#terraform state mv aws_instance.old aws_instance.new
# resource "aws_instance" "new" {
#   ami           = data.aws_ami.amzn.id
#   instance_type = "t3.micro"
# }

#Using the moved block to move the state of the existing resource to the new resource name. The moved block is used to specify the old resource name and the new resource name. The moved block is used to move the state of the existing resource to the new resource name. The moved block is used to specify the old resource name and the new resource name. The moved block is used to move the state of the existing resource to the new resource name. The moved block is used to specify the old resource name and the new resource name. The moved block is used to move the state of the existing resource to the new resource name. The moved block is used to specify the old resource name and the new resource name. The moved block is used to move the state of the existing resource to the new resource name. The moved block is used to specify the old resource name and the new resource name. The moved block is used to move the state of the existing resource to the new resource name. The moved block is used to specify the old resource name and the new resource name. The moved block is used to move the state of the existing resource to the new resource name. The moved block is used to specify the old resource name and the new resource name. The moved block is used to move the state of the existing resource to the new resource name. The moved block is used to specify the old resource name and the new resource name. The moved block is used to move
moved {
  from = aws_instance.new_list[0]
  to   = aws_instance.new_final[0]
}
moved {
  from = aws_instance.new_list[1]
  to   = aws_instance.new_final[1]
}
#What if you increase the count of the resource? It will create a new instance and not use the existing one. You can use the terraform state mv command to move the state of the existing resource to the new resource name.
resource "aws_instance" "new_final" {
  count         = 0
  ami           = data.aws_ami.amzn.id
  instance_type = "t3.micro"
}
