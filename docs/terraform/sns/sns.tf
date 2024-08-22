# Creates an SNS topic for GuardDuty alerts
resource "aws_sns_topic" "sns_topic" {
    name = "sns-topic"
}

# Attaches a policy to the SNS topic
resource "aws_sns_topic_policy" "sns_topic_policy" {
  arn = aws_sns_topic.sns_topic.arn
  policy = data.aws_iam_policy_document.sns_topic_policy_document.json
}

# Creates a subscription to the SNS topic
resource "aws_sns_topic_subscription" "sns_topic_subscription" {
    topic_arn = aws_sns_topic.sns_topic.arn
    protocol = "email"
    endpoint = "your_email"
}

# Defines the policy document for the SNS topic
data "aws_iam_policy_document" "sns_topic_policy_document" {
    policy_id = "__default_policy_ID"
    statement {
      actions = [
        "SNS:GetTopicAttributes",
        "SNS:SetTopicAttributes",
        "SNS:AddPermission",
        "SNS:RemovePermission",
        "SNS:DeleteTopic",
        "SNS:Subscribe",
        "SNS:ListSubscriptionsByTopic",
        "SNS:Publish"
      ]

      effect = "Allow"
      principals {
        type = "AWS"
        identifiers = ["*"]
      }
      resources = [aws_sns_topic.sns_topic.arn,] # Applies the policy to the specified SNS topic
      sid = "__default_statement_ID"
    }
}
