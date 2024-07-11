module "aws_budgets" {
  source = "github.com/getindata/terraform-aws-budget"

  budgets = {
    custom-notifications = {
      budget_type  = "COST"
      limit_amount = 15
      time_unit    = "MONTHLY"

      cost_types = {
        include_tax = false
      }

      notifications = {
        test = {
          comparison_operator        = "GREATER_THAN"
          notification_type          = "ACTUAL"
          subscriber_email_addresses = ["olefemmy@yahoo.com", "apatafolasade@yahoo.com"]
          threshold                  = 10
          threshold_type             = "PERCENTAGE"
        },
      }
    },

    default-monthly-notifications = {
      budget_type           = "COST"
      limit_amount          = 10
      time_unit             = "MONTHLY"
      extra_email_addresses = []

    },

    maximum-spending = {
      limit_amount = 100
    }
  }

  default_notifications = {
    default-forecast-100 = {
      comparison_operator : "GREATER_THAN"
      threshold : 20
      threshold_type : "PERCENTAGE"
      notification_type : "FORECASTED"
      subscriber_email_addresses : []
    },
    default-actual-80 = {
      comparison_operator : "GREATER_THAN"
      threshold : 80
      threshold_type : "PERCENTAGE"
      notification_type : "ACTUAL"
      subscriber_email_addresses : []
    },
    default-actual-100 = {
      comparison_operator : "GREATER_THAN"
      threshold : 100
      threshold_type : "PERCENTAGE"
      notification_type : "ACTUAL"
      subscriber_email_addresses : []
    }
  }

  default_email_addresses = ["olefemmy@yahoo.com", "apatafolasade@yahoo.com"]
}
