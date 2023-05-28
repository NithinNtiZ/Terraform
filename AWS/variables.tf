variable "region" {
    type = string
#    default =  "ap-south-1"
}

variable "availability_zone" {
    type = string
#    default =  "aps1-az1" #aps1-az2 #aps1-az3
}

variable "cidr_block" {
    type = string
#    default = "10.0.0.0/16"
}

variable "cidr_block_0" {
    type = string
#    default = "0.0.0.0/0"
}

variable "cidr_block_sbnt" {
    type = string
#    default = "10.0.1.0/24"
}

variable "instance_type" {    
  type = string
#  default = "t2.micro"
}

 variable "ami" {    
  type = string
#  default = "ami-068257025f72f470d"
}

 variable "name" {    
  type = string
#  default = "Test_VM"
}