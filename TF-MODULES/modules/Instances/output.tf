output "instance_id_0" {
  value = aws_instance.web[0].id
}

output "instance_id_1" {
  value = aws_instance.web[1].id
}

output "instance_id_2" {
  value = aws_instance.web[2].id
}

output "instance_id_3" {
  value = aws_instance.web[3].id
}

# output "instance_private_ip" {
#   value = aws_instance.web.private_ip
# }

# output "instance_public_ip" {
#   value = aws_instance.web.public_ip
# }

