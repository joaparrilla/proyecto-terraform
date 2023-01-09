variable "ami_id" {
  default     = ""
  description = "AMI Id"
}
variable "instance_type" {

}
variable "tags" {

}
variable "sg_name" {

}
variable "ingress_rule" {

}
variable "egress_rule" {

}

variable "bucket_name" {
  default = "terraform-backend"
}
variable "acl" {
  default = "private"
}