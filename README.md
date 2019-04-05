# webteam-terraform-demo

Helpful docs for this project:

https://learn.hashicorp.com/terraform/
https://www.terraform.io/docs/providers/aws/r/s3_bucket.html
https://www.terraform.io/docs/providers/aws/r/s3_bucket_object.html

Install terraform
```shell
brew install terraform
```

```shell
terraform init
terraform plan -var-file=variables.tfvars
terraform apply -var-file=variables.tfvars
```
