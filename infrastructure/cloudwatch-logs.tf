resource "aws_cloudwatch_log_group" "session_manager_logs" {
  name              = "session_manager_logs"
  retention_in_days = 7
}
