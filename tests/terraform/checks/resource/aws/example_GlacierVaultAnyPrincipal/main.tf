# pass
resource "aws_glacier_vault" "my_archive1" {
  name = "MyArchive"

  access_policy = <<EOF
{
    "Version":"2012-10-17",
    "Statement":[
       {
          "Sid": "add-read-only-perm",
          "Principal": "*",
          "Effect": "Deny",
          "Action": [
             "glacier:InitiateJob",
             "glacier:GetJobOutput"
          ],
          "Resource": "arn:aws:glacier:eu-west-1:432981146916:vaults/MyArchive"
       }
    ]
}
EOF
  tags = {
    yor_trace = "6800e062-a4c0-4392-a95f-2f0331f3f636"
  }
}

# fail
resource "aws_glacier_vault" "my_archive2" {
  name = "MyArchive"

  access_policy = <<EOF
{
    "Version":"2012-10-17",
    "Statement":[
       {
          "Sid": "add-read-only-perm",
           "Principal": { 
            "AWS": [
                "arn:aws:iam::123456789101:role/vault-reader", 
                "*"
            ]
          },
          "Effect": "Allow",
          "Action": [
             "glacier:InitiateJob",
             "glacier:GetJobOutput"
          ],
          "Resource": "arn:aws:glacier:eu-west-1:432981146916:vaults/MyArchive"
       }
    ]
}
EOF
  tags = {
    yor_trace = "44d418ed-4489-4d55-a8d6-91dc7c1ef19c"
  }
}

# fail
resource "aws_glacier_vault" "my_archive3" {
  name = "MyArchive"

  access_policy = <<EOF
{
    "Version":"2012-10-17",
    "Statement":[
       {
          "Sid": "add-read-only-perm",
          "Principal": { 
            "AWS": "arn:aws:iam::*:role/vault-reader"
          },
          "Effect": "Allow",
          "Action": [
             "glacier:InitiateJob",
             "glacier:GetJobOutput"
          ],
          "Resource": "arn:aws:glacier:eu-west-1:432981146916:vaults/MyArchive"
       }
    ]
}
EOF
  tags = {
    yor_trace = "57c02b63-77f5-4278-8d60-4a786f3d4799"
  }
}

# fail
resource "aws_glacier_vault" "my_archive4" {
  name = "MyArchive"

  access_policy = <<EOF
{
    "Version":"2012-10-17",
    "Statement":[
       {
          "Sid": "add-read-only-perm",
           "Principal": { 
            "AWS": "*"
          },
          "Effect": "Allow",
          "Action": [
             "glacier:InitiateJob",
             "glacier:GetJobOutput"
          ],
          "Resource": "arn:aws:glacier:eu-west-1:432981146916:vaults/MyArchive"
       }
    ]
}
EOF
  tags = {
    yor_trace = "75d299f0-3c5d-4cef-aaf1-0c9ffac73c0c"
  }
}

# fail
resource "aws_glacier_vault" "my_archive5" {
  name = "MyArchive"

  access_policy = <<EOF
{
    "Version":"2012-10-17",
    "Statement":[
       {
          "Sid": "add-read-only-perm",
          "Principal": "*",
          "Effect": "Allow",
          "Action": [
             "glacier:InitiateJob",
             "glacier:GetJobOutput"
          ],
          "Resource": "arn:aws:glacier:eu-west-1:432981146916:vaults/MyArchive"
       }
    ]
}
EOF
  tags = {
    yor_trace = "63c21999-af6c-498a-948b-e9757d1272a8"
  }
}

# pass
resource "aws_glacier_vault" "my_archive6" {
  name = "MyArchive"

  access_policy = <<EOF
{
    "Version":"2012-10-17",
    "Statement":[
       {
          "Sid": "add-read-only-perm",
          "Principal": "arn:aws:iam::123456789101:role/vault-reader",
          "Effect": "Allow",
          "Action": [
             "glacier:InitiateJob",
             "glacier:GetJobOutput"
          ],
          "Resource": "arn:aws:glacier:eu-west-1:432981146916:vaults/MyArchive"
       }
    ]
}
EOF
  tags = {
    yor_trace = "2b262bea-40e1-41c6-9f46-4e557ecc8001"
  }
}