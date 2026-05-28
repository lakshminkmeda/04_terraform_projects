Terraform Backend in S3 & DynamoDB

Overview
Code to create a terraform backend with state file stored in S3 bucket and lock file in dynamoDb

Objectives
1. Create the backend
2. Use github actions to run Terraform commands #Any github push triggers the code


Notes
1. Using backend in AWS allows for the files to be locked so that two users can't modify at the  template ar same time. 
2. Can only be run once as the bucket name has to be unique and second run throws error as bucket already exists ### very basic code
