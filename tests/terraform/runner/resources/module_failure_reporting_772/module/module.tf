#
# WARNING: Line numbers mater in this test!
#          Update test_module_failure_reporting_772 if a change is made!
#

# Bucket that will fail (no encryption) defined INSIDE a module
resource "aws_s3_bucket" "inside" {
  bucket = "inside-bucket"
  tags = {
    yor_trace = "01ef788e-bbfd-4d74-9887-0daeb65752e3"
  }
}