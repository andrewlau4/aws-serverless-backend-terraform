# AWS SERVERLESS BACKEND

This is the code to setup AWS backend infrastructure that is required for the [front-end project](https://github.com/andrewlau4/aws-angular-integrate-demo)

I intentionally avoid Amplify CLI in this project; because I think the Amplify CLI, which uses simple questions and answers to generate code, is hiding too much. Also, it is impossible to make changes to the auto-generated code without being overwritten. I wrote my own infrastructure code so it is easier to learn and experiment with.

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

After you run 'terraform apply' all the resources will be created, and the resource IDs will be shown on screen. You need to configure the front-end project using these resource IDs, [production config file](https://github.com/andrewlau4/aws-angular-integrate-demo/blob/main/src/environments/environment.ts), and [development config file](https://github.com/andrewlau4/aws-angular-integrate-demo/blob/main/src/environments/environment.development.ts)

