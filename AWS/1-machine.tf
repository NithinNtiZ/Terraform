######Create a vm #########
 
resource "aws_instance" "Test_VM" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name = "nithinbabu"
  tags = {
    Name = "Test_vm"
  }
  network_interface {
    network_interface_id = aws_network_interface.foo.id
    device_index         = 0
  }

user_data = file("install_apache.sh")


##create interface for vm 
#resource "aws_network_interface" "foo" {
#  subnet_id   = aws_subnet.Test_sbnt1.id
#  private_ips = ["10.0.1.100"]
#  security_groups = [aws_security_group.Test_sg.id]
#}


}

