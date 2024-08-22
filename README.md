# Automatic Cyber Security Alerting AWS System

## Overview
This project automates cyber security alerts within AWS, utilizing AWS GuardDuty for threat detection, SNS for notifications, and CloudWatch for event monitoring. It ensures continuous protection and real-time alerts based on customizable thresholds.

## Features
- **Continuous Threat Detection:** GuardDuty monitors your AWS environment for suspicious activity.
- **Real-time Notifications:** SNS sends instant alerts to email or phone.
- **Customizable Alerting:** CloudWatch rules filter and trigger alerts based on severity.

## Architecture
This project utilizes a combination of AWS services and project management tools to ensure a streamlined and efficient workflow.

- **AWS GuardDuty**: Monitors and detects security threats within your AWS environment.
- **AWS SNS (Simple Notification Service)**: Sends real-time alerts based on GuardDuty findings.
- **AWS CloudWatch**: Captures GuardDuty events and triggers SNS notifications based on custom rules.
- **Jira Kanban Board**: Tracks the project's tasks, issues, and progress, ensuring that all aspects of the project are managed efficiently.
#### Jira Board:
![Jira Board](https://i.imgur.com/tC5xeVy.jpeg)
#### Miro Architecture Diagram:
![Architecture Diagram](https://i.imgur.com/nK7btmr.jpeg)

## Directory Structure

- [config/](config/)
  - [input_path.json](config/input_path.json)
  - [input_template.json](config/input_template.json)
- [docs/](docs/)
  - [terraform/](docs/terraform/)
    - [cloudwatch/](docs/terraform/cloudwatch/)
      - [cloudwatch.tf](docs/terraform/cloudwatch/cloudwatch.tf)
      - [variables.tf](docs/terraform/cloudwatch/variables.tf)
    - [guardduty/](docs/terraform/guardduty/)
      - [guardduty.tf](docs/terraform/guardduty/guardduty.tf)
    - [sns/](docs/terraform/sns/)
      - [outputs.tf](docs/terraform/sns/outputs.tf)
      - [sns.tf](docs/terraform/sns/sns.tf)
      - [main.tf](docs/terraform/sns/main.tf)
- [manual-setup.md](manual-setup.md)
- [terraform-setup.md](terraform-setup.md)
- [README.md](README.md)

## Getting Started
### Prerequisites
#### Necessities:
- AWS Account: Required to deploy and manage AWS services like GuardDuty, SNS, and CloudWatch.
#### Optional:
- Terraform: Recommended for automating the deployment of the infrastructure.
- Jira: Useful for project management, tracking tasks, and issues.
- Miro: Ideal for creating flowcharts and diagrams to visualize the architecture.

## Setup Instructions
Choose your preferred setup method:
- [Manual Setup via AWS Console](docs/manual-setup.md)
- [Automated Setup via Terraform](docs/terraform-setup.md)

## Usage

Once the system is set up, you can use it to monitor and receive alerts for security events in your AWS environment. Here’s how to interact with and test the system:

#### 1. Generate Sample Findings

To simulate a security incident and test the notification system:
- Navigate to the AWS GuardDuty console.
- Use the option to generate sample findings.
- GuardDuty will create several sample findings that simulate various security events.

#### 2. Receive Notifications

Once sample findings are generated:
- Check your email (or phone) for notifications.
- The notifications should correspond to the findings generated by GuardDuty.

#### 3. Adjust Notification Settings

If you need to adjust the notification settings:
- Modify the SNS topic subscriptions to add or remove email/phone numbers.
- Update the CloudWatch alarm thresholds and actions as needed.

#### 4. Review Findings and Respond

For each finding:
- Review the details in the GuardDuty console.
- Take appropriate action to investigate and mitigate the issue.

#### 5. Clean Up

If you want to remove the setup:
- For the Terraform setup, run `terraform destroy` in the `terraform` directory.
- Manually delete resources through the AWS Console if set up manually.

By following these steps, you can ensure that your Automatic Cyber Security Alerting AWS System is properly monitoring your environment and that you are promptly notified of any significant security events.
