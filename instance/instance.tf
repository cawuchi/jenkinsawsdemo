resource "aws_instance" "my_vm"{

  ami = "ami-0688ba7eeeeefe3cd"
  instance_type = "t2.mirco"
  availability_zone = "us-west-2"

  tags = {
    Name = "My EC2 instance",
 }

}
