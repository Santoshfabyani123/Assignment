resource "aws_security_group" "us_west_sg" {
  # checkov:skip=CKV_AWS_382: Demo project
  description = "security group for nginx"
vpc_id = aws_vpc.aws_west_vpc.id
ingress  {
description = "for nginx exposure"
from_port = 80
to_port = 80
protocol = "tcp"
cidr_blocks = ["10.0.1.0/24", "10.0.2.0/24"]
}

egress {
description = "for nginx exposure"
from_port = 0
to_port = 0
protocol = "-1"
cidr_blocks = ["0.0.0.0/0"]
}
tags = {

    Name ="us_west_sg"
}
}