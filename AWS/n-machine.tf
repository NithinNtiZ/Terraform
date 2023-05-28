resource "aws_instance" "Test_VM_2" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name = "nithinbabu"
  count = 2
  subnet_id = aws_subnet.Test_sbnt1.id
  security_groups = [aws_security_group.Test_sg.id]
  tags = {
    Name = "${var.name}-${count.index+1}"
  }
}