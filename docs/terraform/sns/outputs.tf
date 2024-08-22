# Outputs the ARN of the SNS topic
output "sns_topic_arn"{
    value = aws_sns_topic.sns_topic.arn
}
