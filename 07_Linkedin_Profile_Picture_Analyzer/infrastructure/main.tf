# Provider configuration for AWS
provider "aws" {
  region = var.AWS_REGION # eu‑central‑1 – everything *except* WAF
}

provider "aws" {
  alias  = "us_east_1"
  region = "us-east-1" # For configuring and associating WAF with Cloudfront (global)
}

# This configuration is used to store the Terraform remote state file in an S3 bucket
# Make sure bucket versioning is enabled
# You have to hardcode the bucket name and region here
terraform {
  backend "s3" {
    bucket       = "terraform-state-bucket-593793041840"
    key          = "terraform.tfstate"
    region       = "eu-central-1"
    use_lockfile = false # Enable this when you are in a team
  }
}
