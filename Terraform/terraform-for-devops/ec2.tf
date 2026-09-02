# key pair (login to ec2 instance using key pair)

resource "aws_key_pair" "my_key" {
  key_name   = "${var.env}-terra-key-ec2"
  public_key = file("terra-key-ec2.pub")
  tags = {
    environment = var.env
  }
}

# VPC & Security group (allow ssh access to ec2 instance)

resource "aws_default_vpc" "default" {

}

resource "aws_security_group" "my_security_group" {
  name        = "${var.env}-security-group"
  description = "Allow SSH access"
  vpc_id      = aws_default_vpc.default.id #interpolation (it is way in which we can inherit and extract value from terraform block)

  #inbound rule to allow ssh access to ec2 instance
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow SSH access from anywhere"
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow HTTP access from anywhere"
  }

  ingress {
    from_port   = 8000
    to_port     = 8000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Chat application access from anywhere"
  }

  #outbound rule to allow ssh access to ec2 instance

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outbound traffic"
  }

  tags = {
    Name = "${var.env}-security-group"
    environment = var.env
  }
}

# ec2 instance

resource "aws_instance" "my_instance" {
  #   count           = 2 #meta argument (count is used to create multiple instances of the same resource)
  for_each = tomap({
    instance1 = "t2.micro",
    instance2 = "t2.medium",
    instance3 = "t2.large"
  }) # meta arguments

  depends_on      = [aws_security_group.my_security_group, aws_key_pair.my_key] # meta argument (depends_on is used to create dependency between resources)
  key_name        = aws_key_pair.my_key.key_name
  security_groups = [aws_security_group.my_security_group.name]
  #   instance_type   = var.ec2_instance_type
  instance_type = each.value
  ami           = var.ec2_ami_id
  user_data     = file("install_nginx.sh")

  root_block_device {
    volume_size = var.env == "prd" ? 20 : var.ec2_default_root_storage_type
    volume_type = "gp3"
  }

  tags = {
    Name = each.key
    Environment = var.env
  }
}

# import the instance terra server from AWS
# resource "aws_instance" "my_new_instance" {
#     ami = "unknown"
#     instance_type = "unknown"

# }