resource "aws_kms_key" "puppet_master_kms_key" {
  description                        = "Key used to encrypt puppet private key"
  deletion_window_in_days            = 10
  enable_key_rotation                = true
  bypass_policy_lockout_safety_check = false
}

resource "aws_kms_alias" "puppet_master_kms_alias" {
  name          = "alias/puppet-master-key"
  target_key_id = aws_kms_key.puppet_master_kms_key.key_id
}

resource "aws_kms_key" "deployment_master_kms_key" {
  description                        = "Key used to encrypt secrets in application configuration"
  deletion_window_in_days            = 10
  enable_key_rotation                = true
  bypass_policy_lockout_safety_check = false

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Id": "key-default-1",
  "Statement": [
    {
      "Sid": "Enable IAM User Permissions",
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"
      },
      "Action": "kms:*",
      "Resource": "*"
    },
    {
      "Sid": "Allow use of the key",
      "Effect": "Allow",
      "Principal": {"AWS": [
        "*"
      ]},
      "Action": [
        "kms:Encrypt",
        "kms:Decrypt",
        "kms:ReEncrypt*",
        "kms:GenerateDataKey*",
        "kms:DescribeKey"
      ],
      "Resource": "*"
    }
  ]
}
EOF

}

resource "aws_kms_alias" "deployment_master_kms_alias" {
  name          = "alias/deployment-master-key"
  target_key_id = aws_kms_key.deployment_master_kms_key.key_id
}

