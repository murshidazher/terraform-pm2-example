# Outputs.tf
output "instance_id" {
  description = "Instance ID of the instance"
  value       = aws_instance.web_pm2sdbx.id
}

output "instance_ip" {
  description = "Public IP of the instance"
  value       = aws_instance.web_pm2sdbx.public_ip
}

output "instance_public_dns" {
  description = "Public DNS of the instance"
  value       = aws_instance.web_pm2sdbx.public_dns
}


# output "pm2-cluster_elastic_ip" {
#   description = "pm2-cluster elastic IP attached to the instance"
#   value       = aws_eip_association.eip_assoc_pm2-cluster.public_ip
# }

