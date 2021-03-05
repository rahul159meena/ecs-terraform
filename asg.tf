resource "aws_autoscaling_group" "asg" {
  availability_zones        = ["us-west-1a"]
  name                      = "terraform-test-asg"
  max_size                  = 2
  min_size                  = 1
  health_check_grace_period = 300
  health_check_type         = "ELB"
  force_delete              = true
}