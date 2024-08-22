# CloudWatch Event Rule to capture GuardDuty findings
resource "aws_cloudwatch_event_rule" "cloudwatch_rule" {
    name = "cloudwatch-rule"
    description = "Capture Guardduty Findings."
    event_pattern  = "{\"source\":[\"aws.guardduty\"],\"detail-type\":[\"GuardDuty Finding\"]}" # Filters for GuardDuty findings
}

# CloudWatch Event Target to send findings to SNS
resource "aws_cloudwatch_event_target" "cloudwatch_target" {
    rule = aws_cloudwatch_event_rule.cloudwatch_rule.name
    target_id = "SendToSNS"
    arn = var.sns_topic_arn # Passes the SNS topic ARN as a variable

    input_transformer { # Formats the notification into a readable message
    input_paths = {
      Account_ID          = "$.detail.accountId"
      Finding_ID          = "$.detail.id"
      Finding_Type        = "$.detail.type"
      Finding_description = "$.detail.description"
      region              = "$.region"
      severity            = "$.detail.severity"
    }

    input_template = "\"ALOL AWS <Account_ID> has a severity <severity> GuardDuty finding type <Finding_Type> in the <region> region.\"\n\"Finding Description:\"\n\"<Finding_description>. \"\n\"For more details open the GuardDuty console at https://console.aws.amazon.com/guardduty/home?region=<region>#/findings?search=id%3D<Finding_ID>\""
  }
}
