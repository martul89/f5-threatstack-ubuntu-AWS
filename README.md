# f5-threatstack-ubuntu-AWS
This terraform script will create ubuntu EC2 instance and execute command in nginx.sh
In the nginx.sh, there is a part where threatstack agent will be installed in the machine.

The configuration file that needs to be edited,
* variables.tf 

In summary the module will perform,
* AWS VPC and Security Group Creation 
* AWS EC2 Ubuntu 20.4 Creation and Association with Security Group and VPC
* Execution of nginx.sh in the newly spin up instance

# Terraform and Provider Version

This Terraform module currently tested on using below provider versions:
* `terraform version` ~> 1.0.9
* `template` ~> 3.1.0
* `aws` ~> 3.74.0

