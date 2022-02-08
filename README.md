# f5-threatstack-ubuntu-AWS
This terraform script will create ubuntu EC2 instance and execute command in nginx.sh
In the nginx.sh, there is a part where threatstack agent will be installed in the machine.

The configuration file that needs to be edited,
* variables.tf 
* nginx.sh

In summary the terraform script will perform,
* AWS VPC and Security Group Creation 
* AWS EC2 Ubuntu 20.4 Creation and Association with Security Group and VPC
* Execution of nginx.sh in the newly spin up instance

# Terraform and Provider Version

This Terraform module currently tested on using below provider versions:
* `terraform version` ~> 1.0.9
* `template` ~> 3.1.0
* `aws` ~> 3.74.0

# Variables 

Before using the terraform script, the user is required to edit `variables.tf` and provide necessary AWS spesific parameter.
* AWS Region where the EC2 will be deployed
* Availability Zone (AZ) for VPC
* AWS Access Key and Secret Key for authentication
* AWS EC2 Instance Type
* Prefix -> unique identifier that will be appended in the object name creation, can put any values such as name or ID
* AWS PEM Key Name to enable SSH into the EC2 Instance

For the threatstack agent to join the console, user need to input ___--deploy-key___ parameter on `nginx.sh` file.

The ___--deploy-key___ can get from the threatstack dashboard as shown below,

![Threatstack output](https://github.com/martul89/f5-threatstack-ubuntu-AWS/blob/main/doc/threatstack-addserver.jpg "Threatstack output")

# Usage

After editing variables, to use the code,
* `git clone git@github.com:martul89/f5-threatstack-ubuntu-AWS.git ` 
* `terraform init` 
* `terraform plan` 
* `terraform apply --auto-approve` 

When the script is successful, the user will get output similar to below.

To_SSH_into_the_ubuntu ssh -i name_key.pem ubuntu@PUBLIC_IP