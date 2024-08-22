# AWS provider configuration
provider "aws" {
    region     = "eu-west-2" # Change region as necessary
    access_key = "your_access_key" # Insert your access and secret keys here
    secret_key = "your_secret_key"
}

# GuardDuty module configuration
module "guardduty" {
  source = "./guardduty"
}

# SNS module configuration
module "sns" {
  source = "./sns"
}

# CloudWatch module configuration
module "cloudwatch" {
  source        = "./cloudwatch"
  sns_topic_arn = module.sns.sns_topic_arn  # Fetches sns_topic arn from sns module
}
