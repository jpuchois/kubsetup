resource "aws_instance" "kubMaster" {
  ami = "${var.ami}"
  instance_type = "${var.size}"
  subnet_id = "${aws_subnet.kub_sub01.id}"
  vpc_security_group_ids = ["${aws_security_group.kub_sg.id}"]
  key_name      = "${var.key}"                                        

  tags = {
    Name = "kubMaster"
  }

  connection {
    host = "${self.public_ip}"
    type        = "ssh"
    user        = "ubuntu"
    private_key = "${file(var.keypath)}"
  }

  provisioner "file" {
    source      = "scripts/k8sMaster.sh"
    destination = "~/k8sMaster.sh"

  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x ~/k8sMaster.sh",
      "~/k8sMaster.sh",
    ]
  }
}





resource "aws_instance" "kubWorker" {
  ami = "${var.ami}"
  instance_type = "${var.size}"
  subnet_id = "${aws_subnet.kub_sub01.id}"
  vpc_security_group_ids = ["${aws_security_group.kub_sg.id}"]
  key_name      = "${var.key}"

  tags = {
    Name = "kubWorker"
  }
  connection {
    host = "${self.public_ip}"
    type        = "ssh"
    user        = "ubuntu"
    private_key = "${file(var.keypath)}"
  }

  provisioner "file" {
    source      = "scripts/k8sSecond.sh"
    destination = "~/k8sSecond.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x ~/k8sSecond.sh",
      "~/k8sSecond.sh",
    ]
  }
}


output "Master_IP_addr" {
  value = aws_instance.kubMaster.public_ip
}

output "Worker_IP_addr" {
  value = aws_instance.kubWorker.public_ip
}




