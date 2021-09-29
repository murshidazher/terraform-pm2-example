// usage ${data.terraform_remote_state.openvpn_remote_state.outputs.openvpn_elastic_ip}
data "terraform_remote_state" "jenkins_remote_state" {
  backend = "s3"
  config = {
    bucket = "terraform-pm2-cluster-openvpn"
    key    = "sandbox-jenkins/terraform.tfstate"
    region = "us-east-1"
  }
}
