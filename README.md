# AWS SERVERLESS BACKEND

This is the code to setup AWS backend infrastructure that is required for the [front-end project](https://github.com/andrewlau4/aws-angular-integrate-demo)  

You will need Terraform and AWS CLI configured before running this code.

This code will set up the resources that is required by the front-end project:

* Cognito
* S3
* IAM Roles

Run these commands to setup the AWS Infrastructure. 

```
terraform init
terraform plan
terraform apply
```