# This file is the variable file which can be customized as per your deployment. 

# Select the region required, make sure the AMI is valid for that region.
variable "region" {
  description = "Regions supported"
  default     = "ap-southeast-1"
}

# Provide AZs, default is ap-southeast-1a
variable "azs" {
  description = "AZ for VPC"
  default     = "ap-southeast-1a"
}

# Provide the access key to your AWS account
variable "access_key" {
  description = "access key to AWS account"
  default     = "XXXX"
}

# Provide the secret key to your AWS account
variable "secret_key" {
  description = "secret key to AWS account"
  default     = "XXXX"
}

# Provide the EC2 instance type
variable "instance_type" {
  description = "instance type for EC2"
  default     = "m5.large"
}

# Please assign unique indentifier so thate the resources not conflicting
variable "prefix" {
  description = "prefix for resources created"
  default     = "fwinata_testing"
}

/* 3rd June update : Not required anymore the script will create the PEm keys also
# Please assign AWS keypair so that you can have access to the EC2 later
variable "key_name" {
  description = "PEM key to ssh later"
  default     = "fwinata-key-example"
}
*/

#This is the private IP addresses of the servers, the first will get the ip address 10.0.0.172 (example only)
variable "private_ip_nginx" {
  description = "private ip for nginx"
  type = list(string)
  default = ["10.0.0.172","10.0.0.173"]
}
