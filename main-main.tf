provider "aws" {
  region = "eu-west-1"
}

# Instances Moudle
module "web_servers" {
  source = "./TF-MODULES/modules/Instances"
}

# VPC Module
module "default_vpc" {
  source = "./TF-MODULES/modules/default-vpc"
}

data "aws_security_group" "default" {
  vpc_id = module.default_vpc.vpc_id
  name   = "default"
}

data "aws_subnet_ids" "subnet_ids" {
  vpc_id = module.default_vpc.vpc_id
}

# S3 Bucket Moudle 
module "Bucket" {
  source = "./TF-MODULES/modules/S3-Bucket" 
}

# ELB - Internnal Moudle
module "elb_internal" {
  source = "./TF-MODULES/modules/Load Balancers"

  name = "internal-elastic-lb"

  subnets         = data.aws_subnet_ids.subnet_ids.ids
  security_groups = [data.aws_security_group.default.id]
  internal        = true

  listener = [
    {
      instance_port     = 80
      instance_protocol = "HTTP"
      lb_port           = 80
      lb_protocol       = "HTTP"
    },
    {
      instance_port     = 8080
      instance_protocol = "http"
      lb_port           = 8080
      lb_protocol       = "http"
    },
  ]
  instances = [module.web_servers.instance_id_0, module.web_servers.instance_id_1, module.web_servers.instance_id_2, module.web_servers.instance_id_3]
}

# ELB Attachment - Internal
module "elb_attachment_internal" {
  source = "./TF-MODULES/modules/elb_attachment"

  create_attachment = true

  number_of_instances = 4

  elb       = "${module.elb_internal.elb_id}"
  instances = [module.web_servers.instance_id_0, module.web_servers.instance_id_1, module.web_servers.instance_id_2, module.web_servers.instance_id_3]
}

# ELB - Internet facing Moudle
module "elb_internet_facing" {
  source = "./TF-MODULES/modules/Load Balancers"

  name = "elastic-lb-internet-facing"

  subnets         = data.aws_subnet_ids.subnet_ids.ids
  security_groups = [data.aws_security_group.default.id]
  internal        = false

  listener = [
    {
      instance_port     = 80
      instance_protocol = "HTTP"
      lb_port           = 80
      lb_protocol       = "HTTP"
    },
    {
      instance_port     = 8080
      instance_protocol = "http"
      lb_port           = 8080
      lb_protocol       = "http"
    },
  ]
  instances = [module.web_servers.instance_id_0, module.web_servers.instance_id_1, module.web_servers.instance_id_2, module.web_servers.instance_id_3]
}

# ELB Attachment - Internet facing Moudle 
module "elb_attachment_internet-facing" {
  source = "./TF-MODULES/modules/elb_attachment"

  create_attachment = true
  number_of_instances = 4
  elb       = "${module.elb_internet_facing.elb_id}"
  instances = [module.web_servers.instance_id_0, module.web_servers.instance_id_1, module.web_servers.instance_id_2, module.web_servers.instance_id_3]
}

# RDS Module
module "rds_db_instance_01" {
  source = "./TF-MODULES/modules/rds-db"
}