resource "aws_instance" "ec2_instance" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.ec2_security_group.id]
  subnet_id              = aws_subnet.private_subnet_ec2.id 
  count                  = 1
  
  tags = {
    Name = "ec2_instance"
  }
}