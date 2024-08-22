# Enables GuardDuty for the AWS account
resource "aws_guardduty_detector" "guardduty_detector" {
    enable = true
}
