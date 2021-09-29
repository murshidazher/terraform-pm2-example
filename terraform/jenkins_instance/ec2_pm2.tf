locals {
  stage_app_name      = "${var.AppName}-${terraform.workspace}"
  storage_volume_name = "data-${var.AppName}-${terraform.workspace}"
  connection_type     = "ssh"
  default_username    = "ubuntu"
  user_data_source    = "scripts/user_data.sh"
}

# EC2 resource
resource "aws_instance" "web_pm2sdbx" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.KeyPairName
  subnet_id              = data.terraform_remote_state.vpc_remote_state.outputs.sbnet_ext02_ip
  vpc_security_group_ids = [aws_security_group.sg_web_pm2sdbx.id]
  user_data              = file(local.user_data_source)

  root_block_device {
    volume_type           = var.volume_type
    volume_size           = var.volume_size
    delete_on_termination = var.delete_storage_on_termination

    tags = {
      Name        = local.storage_volume_name
      Environment = "${terraform.workspace}"
    }
  }

  tags = {
    Name        = local.stage_app_name
    Environment = "${terraform.workspace}"
  }

  connection {
    type        = local.connection_type
    user        = lookup(var.aws_instance_connection_username, var.ami_type, local.default_username)
    private_key = file("./scripts/hwsndbx.pem")
    host        = self.public_ip
  }

  lifecycle {
    create_before_destroy = true
  }
}

# creating elastic ip to have a stable public ip to connect to instance
# resource "aws_eip" "eip_web_pm2sdbx" {
#   instance = aws_instance.web_pm2sdbx.id
#   vpc      = true

#   tags = {
#     Name = "eip-${local.stage_app_name}"
#   }
# }

# attach to the ec2 instance
# resource "aws_eip_association" "eip_assoc_pm2-cluster" {
#   instance_id   = aws_instance.web_pm2sdbx.id
#   allocation_id = aws_eip.eip_web_pm2sdbx.id
# }

# resource "null_resource" "start_pm2-cluster" {
#   provisioner "local-exec" {
#     on_failure  = fail
#     interpreter = ["/bin/bash", "-c"]
#     command     = <<EOT
#         echo -e "\x1B[31m Warning! Restarting instance having id ${aws_instance.web_pm2sdbx.id}.................. \x1B[0m"
#         aws ec2 start-instances --instance-ids ${aws_instance.web_pm2sdbx.id} --profile edutf
#         echo "==> Started"
#      EOT
#   }
# }

# resource "null_resource" "stop_pm2-cluster" {
#   provisioner "local-exec" {
#     on_failure  = fail
#     interpreter = ["/bin/bash", "-c"]
#     command     = <<EOT
#         echo -e "\x1B[31m Warning! Stopping instance having id ${aws_instance.web_pm2sdbx.id}.................. \x1B[0m"
#         # To stop instance
#         aws ec2 stop-instances --instance-ids ${aws_instance.web_pm2sdbx.id} --profile edutf
#         echo "==> Stopped"
#      EOT
#   }
# }
