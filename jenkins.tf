provider "aws" {
    region = "ap-south-1"
}

resource "aws_iam_user" "jenkins-user-01" {
    name = "jenkins-cicd"
}

resource "aws_iam_access_key" "jenkins_access_key" {
    user = aws_iam_user.jenkins-user-01.name
}

resource "aws_iam_user_policy_attachment" "jenkins_ec2_policy_attachment" {
    user = aws_iam_user.jenkins-user-01.name
    policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
}

resource "aws_iam_user_policy_attachment" "jenkins_rds_policy_attachment" {
    user = aws_iam_user.jenkins-user-01.name
    policy_arn = "arn:aws:iam::aws:policy/AmazonRDSFullAccess"
}

resource "aws_iam_user_policy_attachment" "jenkins_s3_policy_attachment" {
    user = aws_iam_user.jenkins-user-01.name
    policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}

resource "aws_iam_user_policy_attachment" "jenkins_vpc_policy_attachment" {
    user = aws_iam_user.jenkins-user-01.name
    policy_arn = "arn:aws:iam::aws:policy/AmazonVPCFullAccess"
}

resource "local_file" "jenkins_access_keys" {
  filename = "jenkins_access_keys.csv"
  content  = <<-EOT
     ${aws_iam_access_key.jenkins_access_key.id},${aws_iam_access_key.jenkins_access_key.secret}
  EOT
}