# Terraform Setup Guide
This guide will help you set up the infrastructure for the Automatic Cyber Security Alerting AWS System using Terraform.
### Prerequisites:
- AWS account with necessary IAM permissions.
- Terraform installed on your local machine.
- AWS credentials configured

### Steps:

1. **Clone the Repository:**
```
git clone https://github.com/KacperKolasa/Automatic-Cyber-Security-Alerting-AWS-System.git
cd Automatic-Cyber-Security-Alerting-AWS-System
```

2. **Initialize Terraform:**
Navigate to the directory containing the Terraform configuration files, in this case, docs/terraform/, and run:
```
terraform init
```
This command initializes the Terraform working directory by downloading the necessary provider plugins.

3. **Review and Modify Variables:**
Review the .tf files and adjust the necessary variables such as aws region, access key, secret key and email address to your liking.

5. **Plan and Apply the Terraform Configuration:**
To see what changes are made to your infrastructure, run:
```
terraform plan
```
And, if your're happy with everything, run: 
```
terraform apply
```
Terraform will then prompt you to confirm the changes. Type yes to proceed.

5. **Verify Deployment:**
Once Terraform completes, verify that GuardDuty, SNS, and CloudWatch are correctly set up in your AWS console, you can do this by generating sample findings through GuardDuty.

7. **Cleanup:**
If you need to tear down the infrastructure, run:
```
terraform destroy
```
