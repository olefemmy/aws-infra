resource "aws_budgets_budget" "all-cost-daily-budget" {
  name         = "all-cost-daily-budget"
  budget_type  = "COST"
  limit_amount = "1"
  limit_unit   = "USD"
  time_unit    = "DAILY"

  notification {
    comparison_operator        = "GREATER_THAN"
    threshold                  = "100"
    threshold_type             = "PERCENTAGE"
    notification_type          = "ACTUAL"
    subscriber_email_addresses = ["apatafolasade@yahoo.com", "olefemmy@yahoo.com"]
  }
}
