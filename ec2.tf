resource "aws_instance" "us-west-2a" {
# checkov:skip=CKV_AWS_8: Demo project
  # checkov:skip=CKV2_AWS_41: Demo project
  ami = "ami-04158184f60ea8b5e"
  instance_type = "t3.micro"
   root_block_device {
 encrypted     = true
 }
  subnet_id = aws_subnet.us_west_2a_public_subnet.id
    ebs_optimized = true
    monitoring = true
    metadata_options {
      http_endpoint = "enabled"
      http_tokens = "required"
    }
  security_groups = [aws_security_group.us_west_sg.id]
  user_data = <<-EOF
                #!/bin/bash
                #install nginx
                sudo yum update -y
                sudo yum install nginx -y
                sudo systemctl start nginx

                 #insall docker
                
                sudo yum install docker -y
                sudo systemctl start docker 
                sudo systemctl enable docker
                EOF

                tags = {
                  Name = "us-west-2a"
                }
}


resource "aws_instance" "us-west-2b" {
  # checkov:skip=CKV_AWS_8: Demo project
  # checkov:skip=CKV2_AWS_41: Demo project
  ami = "ami-04158184f60ea8b5e"
  instance_type = "t3.micro"
  root_block_device {
    encrypted     = true
 }
  subnet_id = aws_subnet.us_west_2b_public_subnet.id
  security_groups = [aws_security_group.us_west_sg.id]
  ebs_optimized = true
  monitoring = true
  metadata_options {
      http_endpoint = "enabled"
      http_tokens = "required"
    }
  user_data = <<-EOF
                #!/bin/bash
                #install nginx
                sudo yum update -y
                sudo yum install nginx -y
                sudo systemctl start nginx 
                sudo systemctl enable nginx

                #insall docker
                
                sudo yum install docker -y
                sudo systemctl start docker 
                sudo systemctl enable docker
                EOF

  tags = {
     Name = "us-west-2b"
  }
}
output "name" {
  value = aws_instance.us-west-2a.private_ip
}

output "url" {
  value = "http://${aws_instance.us-west-2a.private_ip}"
}