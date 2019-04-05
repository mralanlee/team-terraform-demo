provider "aws" {
  region = "us-west-2"

  shared_credentials_file = "${pathexpand(
    "~/.aws/credentials"
  )}"

  profile                     = "dev"
  skip_credentials_validation = true
  skip_requesting_account_id  = true
}
