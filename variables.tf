variable "terraform_region" {
    description = "s3 backed region"
    type = string
  }

variable "aws_region" {
    description = "region to deploy resources"
    type = string
  }

variable "availability_zone_public_subnet" {
    description = "availability zone for subnets"
    type = string
}

variable "availability_zone_private_subnet_ec2" {
    description = "availability zone for subnets"
    type = string
}


variable "availability_zone_private_subnet_rds" {
    description = "availability zone for subnets"
    type = string
}

variable "vpc_cidr" {
    description = "CIDR block for vpc"
    type = string
}

variable "public_subnet_cidr" {
    description = "CIDR block for the public subnet"
    type = string
}

variable "private_subnet_ec2_cidr" {
    description = "CIDR block for private subnet ec2"
    type = string
}

variable "private_subnet_rds_cidr" {
    description = "CIDR block for private subnet RDS"
    type = string
}

variable "ami_id" {
    description = "ID of AMI for EC2 instance"
    type = string
}

variable "key_name" {
    description = "key name for EC2 instance"
    type = string
}

variable "instance_type" {
    description = "instance type for ec2 instance"
    type = string
}

variable "engine" {
    description = "db engine for RDS instance"
    type = string
}

variable "engine_version" {
    description = "the db engine version for RDS instance"
    type = string
}

variable "instance_class" {
    description = "instance class for RDS instance"
    type = string
}

variable "username" {
    description = "username for RDS instance"
    type = string  
}

variable "password" {
    description = "password for RDS instance"
    type = string
}




  


  



