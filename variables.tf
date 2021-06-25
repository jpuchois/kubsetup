variable "aws_region" {
	default = "eu-west-3"
}

variable "vpc_cidr" {
	default = "10.20.0.0/16"
}

variable "subnets_cidr" {
	type = string
	default = "10.20.1.0/24"
}

variable "azs" {
	type = string
	default = "eu-west-3a"
}


variable "size" {
        type = string
        default = "t2.medium"
}


variable "ami" {
        type = string
        default = "ami-06602da18c878f98d"
}

variable "key" {
        type = string
        default = "myvm_key"
}


variable "keypath" {
        type = string
        default = "~/.ssh/myvm_key.pem"
}
