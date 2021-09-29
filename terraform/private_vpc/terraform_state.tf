# aws s3api create-bucket --bucket terraform-pm2-cluster-openvpn --region us-east-1 --create-bucket-configuration LocationConstraint=us-east-1 --profile edutf

terraform {
  backend "s3" {
    encrypt = true
    bucket  = "terraform-pm2-cluster-openvpn"
    key     = "sandbox-vpc/terraform.tfstate"
    region  = "us-east-1"
  }
}
