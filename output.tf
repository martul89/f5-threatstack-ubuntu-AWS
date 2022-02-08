
output "ec2_ip" {
   value = "${aws_instance.nginx.public_ip}"
 }

 output "To_SSH_into_the_ubuntu" {
  value =  "ssh -i ${var.key_name}.pem ubuntu@${aws_instance.nginx.public_ip}"
}
