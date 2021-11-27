# resource "aws_instance" "web-server-instance" {
#   ami           = var.instance_ami
#   instance_type = var.instance_type
#   availability_zone = var.availability_zone
#   key_name = var.instance_key
  
#   user_data = <<-EOF
#     echo "This server has been created on $(date), by Terraform" > /var/creation_time.txt
#   EOF

#   tags = {
#     Name = var.instance_name_tag
#   }
# }

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

# provides an EC2 instance resource. 
resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  count = 4
  # vpc_security_group_ids  = [aws_security_group.allow_web.id]
  tags = {
    Name = "web-server-${count.index}"
  }
}