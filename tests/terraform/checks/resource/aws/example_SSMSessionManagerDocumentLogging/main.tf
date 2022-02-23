# pass

resource "aws_ssm_document" "s3_enabled_encrypted" {
  name          = "SSM-SessionManagerRunShell"
  document_type = "Session"

  content = <<DOC
  {
    "schemaVersion": "1.0",
    "description": "Document to hold regional settings for Session Manager",
    "sessionType": "Standard_Stream",
    "inputs": {
      "s3BucketName": "example",
      "s3KeyPrefix": "",
      "s3EncryptionEnabled": true,
      "cloudWatchLogGroupName": "",
      "cloudWatchEncryptionEnabled": true,
      "idleSessionTimeout": "20",
      "cloudWatchStreamingEnabled": true,
      "kmsKeyId": "",
      "runAsEnabled": false,
      "runAsDefaultUser": "",
      "shellProfile": {
        "windows": "",
        "linux": ""
      }
    }
  }
DOC
  tags = {
    yor_trace = "5c8faa0b-27fe-4b64-b447-26722eddf3f3"
  }
}

resource "aws_ssm_document" "s3_enabled_encrypted_yaml" {
  name          = "SSM-SessionManagerRunShell"
  document_type = "Session"

  document_format = "YAML"

  content = <<DOC
  schemaVersion: '1.0'
  description: Document to hold regional settings for Session Manager
  sessionType: Standard_Stream
  inputs:
    s3BucketName: 'example'
    s3KeyPrefix: ''
    s3EncryptionEnabled: true
    cloudWatchLogGroupName: ''
    cloudWatchEncryptionEnabled: true
    cloudWatchStreamingEnabled: true
    kmsKeyId: ''
    runAsEnabled: true
    runAsDefaultUser: ''
    idleSessionTimeout: '20'
    shellProfile:
      windows: ''
      linux: ''
DOC
  tags = {
    yor_trace = "b3c8d3fa-f9bf-4f6d-b751-704b9c22ea50"
  }
}

resource "aws_ssm_document" "cw_enabled_encrypted" {
  name          = "SSM-SessionManagerRunShell"
  document_type = "Session"

  content = <<DOC
  {
    "schemaVersion": "1.0",
    "description": "Document to hold regional settings for Session Manager",
    "sessionType": "Standard_Stream",
    "inputs": {
      "s3BucketName": "",
      "s3KeyPrefix": "",
      "s3EncryptionEnabled": true,
      "cloudWatchLogGroupName": "example",
      "cloudWatchEncryptionEnabled": true,
      "idleSessionTimeout": "20",
      "cloudWatchStreamingEnabled": true,
      "kmsKeyId": "",
      "runAsEnabled": false,
      "runAsDefaultUser": "",
      "shellProfile": {
        "windows": "",
        "linux": ""
      }
    }
  }
DOC
  tags = {
    yor_trace = "82a37fb3-f75f-46f4-855e-904f623aa58d"
  }
}

resource "aws_ssm_document" "cw_enabled_encrypted_yaml" {
  name          = "SSM-SessionManagerRunShell"
  document_type = "Session"

  document_format = "YAML"

  content = <<DOC
  schemaVersion: '1.0'
  description: Document to hold regional settings for Session Manager
  sessionType: Standard_Stream
  inputs:
    s3BucketName: ''
    s3KeyPrefix: ''
    s3EncryptionEnabled: true
    cloudWatchLogGroupName: 'example'
    cloudWatchEncryptionEnabled: true
    cloudWatchStreamingEnabled: true
    kmsKeyId: ''
    runAsEnabled: true
    runAsDefaultUser: ''
    idleSessionTimeout: '20'
    shellProfile:
      windows: ''
      linux: ''
DOC
  tags = {
    yor_trace = "12354adf-f756-4ccd-810a-ae659ca809e0"
  }
}

# failure

resource "aws_ssm_document" "disabled" {
  name          = "SSM-SessionManagerRunShell"
  document_type = "Session"

  content = <<DOC
  {
    "schemaVersion": "1.0",
    "description": "Document to hold regional settings for Session Manager",
    "sessionType": "Standard_Stream",
    "inputs": {
      "s3BucketName": "",
      "s3KeyPrefix": "",
      "s3EncryptionEnabled": true,
      "cloudWatchLogGroupName": "",
      "cloudWatchEncryptionEnabled": true,
      "idleSessionTimeout": "20",
      "cloudWatchStreamingEnabled": true,
      "kmsKeyId": "",
      "runAsEnabled": false,
      "runAsDefaultUser": "",
      "shellProfile": {
        "windows": "",
        "linux": ""
      }
    }
  }
DOC
  tags = {
    yor_trace = "53a39eee-bcd6-4943-953b-b52ad4604ef4"
  }
}

resource "aws_ssm_document" "disabled_yaml" {
  name          = "SSM-SessionManagerRunShell"
  document_type = "Session"

  document_format = "YAML"

  content = <<DOC
  schemaVersion: '1.0'
  description: Document to hold regional settings for Session Manager
  sessionType: Standard_Stream
  inputs:
    s3BucketName: ''
    s3KeyPrefix: ''
    s3EncryptionEnabled: true
    cloudWatchLogGroupName: ''
    cloudWatchEncryptionEnabled: true
    cloudWatchStreamingEnabled: true
    kmsKeyId: ''
    runAsEnabled: true
    runAsDefaultUser: ''
    idleSessionTimeout: '20'
    shellProfile:
      windows: ''
      linux: ''
DOC
  tags = {
    yor_trace = "3bc5ae6e-63d4-4cc0-b564-a0ddc7f7dc85"
  }
}

resource "aws_ssm_document" "s3_enabled_not_encrypted" {
  name          = "SSM-SessionManagerRunShell"
  document_type = "Session"

  content = <<DOC
  {
    "schemaVersion": "1.0",
    "description": "Document to hold regional settings for Session Manager",
    "sessionType": "Standard_Stream",
    "inputs": {
      "s3BucketName": "example",
      "s3KeyPrefix": "",
      "s3EncryptionEnabled": false,
      "cloudWatchLogGroupName": "",
      "cloudWatchEncryptionEnabled": true,
      "idleSessionTimeout": "20",
      "cloudWatchStreamingEnabled": true,
      "kmsKeyId": "",
      "runAsEnabled": false,
      "runAsDefaultUser": "",
      "shellProfile": {
        "windows": "",
        "linux": ""
      }
    }
  }
DOC
  tags = {
    yor_trace = "c83dde46-9075-4885-bf3c-133358506fbd"
  }
}

resource "aws_ssm_document" "s3_enabled_not_encrypted_yaml" {
  name          = "SSM-SessionManagerRunShell"
  document_type = "Session"

  document_format = "YAML"

  content = <<DOC
  schemaVersion: '1.0'
  description: Document to hold regional settings for Session Manager
  sessionType: Standard_Stream
  inputs:
    s3BucketName: 'example'
    s3KeyPrefix: ''
    s3EncryptionEnabled: false
    cloudWatchLogGroupName: ''
    cloudWatchEncryptionEnabled: true
    cloudWatchStreamingEnabled: true
    kmsKeyId: ''
    runAsEnabled: true
    runAsDefaultUser: ''
    idleSessionTimeout: '20'
    shellProfile:
      windows: ''
      linux: ''
DOC
  tags = {
    yor_trace = "7f8dec7b-0eee-419d-8b75-dbc422a96146"
  }
}

resource "aws_ssm_document" "cw_enabled_not_encrypted" {
  name          = "SSM-SessionManagerRunShell"
  document_type = "Session"

  content = <<DOC
  {
    "schemaVersion": "1.0",
    "description": "Document to hold regional settings for Session Manager",
    "sessionType": "Standard_Stream",
    "inputs": {
      "s3BucketName": "",
      "s3KeyPrefix": "",
      "s3EncryptionEnabled": true,
      "cloudWatchLogGroupName": "example",
      "cloudWatchEncryptionEnabled": false,
      "idleSessionTimeout": "20",
      "cloudWatchStreamingEnabled": true,
      "kmsKeyId": "",
      "runAsEnabled": false,
      "runAsDefaultUser": "",
      "shellProfile": {
        "windows": "",
        "linux": ""
      }
    }
  }
DOC
  tags = {
    yor_trace = "9b4ee96c-2869-4f5c-9928-3e4ca4965593"
  }
}

resource "aws_ssm_document" "cw_enabled_not_encrypted_yaml" {
  name          = "SSM-SessionManagerRunShell"
  document_type = "Session"

  document_format = "YAML"

  content = <<DOC
  schemaVersion: '1.0'
  description: Document to hold regional settings for Session Manager
  sessionType: Standard_Stream
  inputs:
    s3BucketName: ''
    s3KeyPrefix: ''
    s3EncryptionEnabled: false
    cloudWatchLogGroupName: 'example'
    cloudWatchEncryptionEnabled: false
    cloudWatchStreamingEnabled: true
    kmsKeyId: ''
    runAsEnabled: true
    runAsDefaultUser: ''
    idleSessionTimeout: '20'
    shellProfile:
      windows: ''
      linux: ''
DOC
  tags = {
    yor_trace = "45f62e23-118c-405f-aa6d-0a44781ef182"
  }
}
