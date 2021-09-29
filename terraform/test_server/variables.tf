# Variables TF File
variable "region" {
  description = "AWS Region"
  default     = "us-east-1"
}

variable "project" {
  description = "Project Name"
  default     = "openvpn-pm2-cluster-server"
}

variable "ami_id" {
  description = "AMI ID to be used for Instance "
  default     = "ami-0d5eff06f840b45e9"
}

variable "ami_type" {
  description = "Type of ami instance"
  default     = "linux-amazon"
}

variable "instance_type" {
  description = "Instance Typebe used for Instance "
  default     = "t2.micro"
}

variable "subnet_id" {
  description = "Subnet ID to be used for Instance "
  default     = "subnet-b4e9fdd3"
}

variable "volume_type" {
  description = "EC2 storage volume type"
  default     = "gp2" # gp2 | standard
}

variable "volume_size" {
  description = "EC2 storage volume size"
  default     = 8
}

variable "delete_storage_on_termination" {
  description = "Delete storage on termination"
  default     = true
}


variable "aws_instance_connection_username" {
  description = "Default usernames of ec2 instaces"
  type        = map(string)

  default = {
    linux-amazon = "ec2-user"
    ubuntu       = "ubuntu"
  }
}

variable "aws_instance_connection_password" {
  description = "Default password of ec2 instace"
  default     = ""
}

variable "AppName" {
  description = "Application Name"
  default     = "PM2SandboxWebServer"
}

variable "KeyPairName" {
  description = "EC2 instance key pair name"
  default     = "hwsndbx"
}
