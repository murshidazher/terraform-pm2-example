terraform {
  backend "s3" {
    encrypt = true
    bucket  = "terraform-pm2-cluster-openvpn"
    key     = "sandbox-server/terraform.tfstate"
    region  = "us-east-1"
  }
}
