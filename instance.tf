resource "aws_instance" "demo" {
  ami           = "ami-0915bcb5fa77e4892"
  instance_type = "t3.micro"

  tags = {
    Name = "Demo"
  }
}

data "aws_ami" "amazon_linux" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn-ami*amazon-ecs-optimized"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["amazon", "self"]
}



resource "aws_launch_configuration" "as_conf" {
  name          = "web_config"
  image_id      = data.aws_ami.amazon_linux.id
  instance_type = "t2.micro"
}