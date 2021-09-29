# Create key using awscli
# aws ec2 create-key-pair --key-name hwsndbx --query 'KeyMaterial' --output text > hwsndbx.pem

provider "aws" {
  region = var.region
}
