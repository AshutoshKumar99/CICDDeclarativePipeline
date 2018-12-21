variable "AWS_SECRET_KEY" {}
variable "AWS_ACCESS_KEY" {}
variable "AWS_REGION" {
default = "eu-west-1"
}
variable "AMIS"
{

type = "map"
 default = {
 
 ap-south-1 = "ami-06bcd1131b2f55803"
 us-east-1 = "ami-0080e4c5bc078760e"
 eu-west-1 = "ami-050889503ddaec473" 
 
 }

}