variable "aws_region" {
  description = "AWS region to deploy into"
  type        = string
  default     = "us-east-1" # Mumbai
}

variable "project_name" {
  description = "Prefix used in resource names and tags"
  type        = string
  default     = "mern-travelmemory"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet (web server, NAT gateway)"
  type        = string
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  description = "CIDR block for the private subnet (database)"
  type        = string
  default     = "10.0.2.0/24"
}

variable "my_ip_cidr" {
  description = "Your public IP in CIDR form, e.g. 203.0.113.25/32. Only this IP can SSH to the web server."
  type        = string

  validation {
    condition     = can(cidrhost(var.my_ip_cidr, 0)) && var.my_ip_cidr != "0.0.0.0/0"
    error_message = "my_ip_cidr must be a valid CIDR such as 203.0.113.25/32 and must not be 0.0.0.0/0."
  }
}

variable "public_key_path" {
  description = "Path to the SSH PUBLIC key that will be installed on both servers"
  type        = string
  default     = "~/.ssh/mern-key.pub"
}

variable "web_instance_type" {
  description = "EC2 size for the web server (2 GB RAM recommended so the React build does not run out of memory)"
  type        = string
  default     = "t3.small"
}

variable "db_instance_type" {
  description = "EC2 size for the MongoDB server"
  type        = string
  default     = "t3.micro"
}

