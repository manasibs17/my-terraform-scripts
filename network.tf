




resource "aws_db_subnet_group" "my_db_subnet_group" {
  name = "subname-06"
  subnet_ids = [aws_subnet.private_subnet_ec2.id,aws_subnet.private_subnet_rds.id]
}


//Creating ec2 endpoint

resource "aws_ec2_instance_connect_endpoint" "webapp" {
  subnet_id = aws_subnet.private_subnet_ec2.id
  tags = {
    Name = "connect_endpoint"
  }
}