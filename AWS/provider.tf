terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws" # If we want to take provider from our artifacctory then we can use this source. and set path to our artifactory. 
                                  # by using propriety "source" and set path to our artifactory.
      version = "6.62.0"
    }
  }
  backend "s3" {
    bucket         = "my-bucket-tunsi-test"
    key            = "terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-dynamodb-for-locks" # Optional: Specify a DynamoDB table for state locking
  }
}

# This is provider configuration for AWS. 
# It specifies the AWS provider and its version. 
# You can add additional configuration options such as region, access keys, etc., as needed for your Terraform setup.

provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "example" {
  ami           = "ami-01a00762f46d584a1" # Replace with a valid AMI ID for your region
  instance_type = "t2.micro"
  # subnet_id     = "sg-01dca7d9a2e5c4035" # Replace with a valid subnet ID for your VPC

}

resource "aws_dynamodb_table" "terraform_locks" {
  name         = "terraform-dynamodb-for-locks"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}

resource "aws_s3_bucket" "example" {
  bucket = "my-bucket-tunsi-test"
}


