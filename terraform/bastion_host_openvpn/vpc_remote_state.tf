// usage ${data.terraform_remote_state.vpc_remote_state.outputs.vpc_id}
data "terraform_remote_state" "vpc_remote_state" {
  backend = "s3"
  config = {
    bucket = "terraform-pm2-cluster-openvpn"
    key    = "sandbox-vpc/terraform.tfstate"
    region = "us-east-1"
  }
}
