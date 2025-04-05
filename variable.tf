# VPC Variables
variable "vpc_cidr" {
  default     = "10.0.0.0/16"
  description = "VPC CIDR block"
  type        = string
}

variable "public_subnet_az1_cidr" {
  default     = "10.0.0.0/24"
  description = "Public subnet AZ1 CIDR block"
  type        = string
}

variable "public_subnet_az2_cidr" {
  default     = "10.0.1.0/24"
  description = "Public subnet AZ2 CIDR block"
  type        = string
}

variable "private_app_subnet_az1_cidr" {
  default     = "10.0.2.0/24"
  description = "Private app subnet AZ1 CIDR block"
  type        = string
}

variable "private_app_subnet_az2_cidr" {
  default     = "10.0.3.0/24"
  description = "Private app subnet AZ2 CIDR block"
  type        = string
}

variable "private_data_subnet_az1_cidr" {
  default     = "10.0.4.0/24"
  description = "Private data subnet AZ1 CIDR block"
  type        = string
}

variable "private_data_subnet_az2_cidr" {
  default     = "10.0.5.0/24"
  description = "Private data subnet AZ2 CIDR block"
  type        = string
}

# Security Group Variables
variable "ssh_location" {
  default     = "0.0.0.0/0"
  description = "IP address that can SSH into EC2 instances"
  type        = string
}

# RDS Variables
variable "database_snapshot_identifier" {
  default     = "arn:aws:rds:us-east-1:xxxxxxx:snapshot:your-snapshot-name"
  description = "Database snapshot ARN"
  type        = string
}

variable "database_instance_class" {
  default     = "db.t3.micro"
  description = "Database instance type"
  type        = string
}

variable "database_instance_identifier" {
  default     = "dev-rds-db"
  description = "Database instance identifier"
  type        = string
}

variable "multi_az_deployment" {
  default     = false
  description = "Create a standby DB instance"
  type        = bool
}

# ALB Variables
variable "ssl_certificate_arn" {
  default     = "arn:aws:acm:us-east-1:xxxxxxx:certificate/your-cert-id"
  description = "SSL certificate ARN"
  type        = string
}

# SNS Topic Variables
variable "operator_email" {
  default     = "your-email@example.com"
  description = "Email address to receive SNS notifications"
  type        = string
}

# Auto Scaling Group Variables
variable "launch_template_name" {
  default     = "dev-launch-template"
  description = "Name of the launch template"
  type        = string
}

variable "ec2_image_id" {
  default     = "ami-xxxxxxxxxxxxxxxxx"
  description = "AMI ID"
  type        = string
}

variable "ec2_instance_type" {
  default     = "t2.micro"
  description = "EC2 instance type"
  type        = string
}

variable "ec2_key_pair_name" {
  default     = "your-keypair-name"
  description = "Name of the EC2 key pair"
  type        = string
}

# Route 53 Variables
variable "domain_name" {
  default     = "yourdomain.com"
  description = "Domain name"
  type        = string
}

variable "record_name" {
  default     = "www"
  description = "Subdomain name"
  type        = string
}
