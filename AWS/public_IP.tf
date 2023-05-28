#create public ip for vm

resource "aws_eip" "pubIP" {
  instance = aws_instance.Test_VM.id
  network_interface = aws_network_interface.foo.id
  associate_with_private_ip = "10.0.1.100"
  vpc      = true
  tags = {
    Name = "Test_IP"
  }
}

#resource "aws_eip" "pubIP_2" {
#  instance = aws_instance.Test_VM_2.id
#  network_interface = aws_network_interface.foo.id
#  associate_with_private_ip = "10.0.1.100"
#  vpc      = true
#}