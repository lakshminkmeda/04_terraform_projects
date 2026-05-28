A simple Terraform Code to deploy resources in AWS.

The following code creates the following resources:
  1. Custom VPC with a cidr 10.0.0.0/24
  2. A public subnet with cidr 10.0.1.0/24
  3. An Internet Gateway, Route Table associated to the vpc
  4. a route to internet using the internet gateway
  5. A security group to allow traffic for the ec2 instances (HTTP & SSH)
  6. An ec2 instance using UBUNTU Linux with custom script to install Apache2
  7. An ec2 instance with Amazon Linux with custom script to install httpd
     
Pre-requisites:
  - Create a Key pair in AWS and save the key file in the same location along with the main.tf file
  - The code uses the name "terraform-demo.pem", you may use a custom name which requires a change in key_pair value in main.tf under AWS_INSTANCES

The variable.tf is for adding any variables in future with a test variable to name the ec2 instance (currently unused). The user data script can be added directly to the main code, a separate file is usually not necessary but used to 
improve the code and future usability.
