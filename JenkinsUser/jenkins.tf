provider "aws" {
  region = "ap-south-1"
}

resource "aws_iam_user" "jenkins_user" {
  name = "jenkins"
}

resource "aws_iam_access_key" "jenkins_access_key" {
  user = aws_iam_user.jenkins_user.name
}

resource "aws_iam_user_policy_attachment" "jenkins_ec2_policy" {
  user       = aws_iam_user.jenkins_user.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
}

resource "aws_iam_user_policy_attachment" "jenkins_rds_policy" {
  user       = aws_iam_user.jenkins_user.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonRDSFullAccess"
}

resource "aws_iam_user_policy_attachment" "jenkins_s3_policy" {
  user       = aws_iam_user.jenkins_user.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}

resource "aws_iam_user_policy_attachment" "jenkins_vpc_policy" {
  user       = aws_iam_user.jenkins_user.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonVPCFullAccess"
}

resource "local_file" "jenkins_access_keys_csv" {
  filename = "jenkins_access_keys.csv"
  content  = <<-EOT
    Access Key ID,Secret Access Key
    ${aws_iam_access_key.jenkins_access_key.id},${aws_iam_access_key.jenkins_access_key.secret}
  EOT
}