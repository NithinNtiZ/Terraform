resource "aws_network_interface" "foo" {
  subnet_id   = aws_subnet.Test_sbnt1.id
  security_groups = [aws_security_group.Test_sg.id]
  private_ips = ["10.0.1.100"]
}

#resource "aws_network_interface_attachment" "test" {
#  instance_id          = aws_instance.Test_VM.id
#  network_interface_id = aws_network_interface.foo.id
#  device_index         = 0
#}