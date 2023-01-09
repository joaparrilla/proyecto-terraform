ami_id        = "ami-03a8737b1f3faff1f"
instance_type = "t2.micro"
tags          = { Name = "proyecto-tf", Environment = "Dev" }
sg_name       = "platzi-rules-remote"
ingress_rule = [
  {
    from_port   = "22"
    to_port     = "22"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  },
  {
    from_port   = "80"
    to_port     = "80"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
]
egress_rule = [
  {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
]