provider "aws" {
  region = "default"
  shared_credentials_file = "C:/Users/Pac/.aws/credentials"
  profile = "Terraform"

}


module "my_vpc"{
    source               = "../modules/vpc"
    vpc_cidr             = "192.168.0.0/16"
    tenancy              = "default"
    vpc_id               = "${module.my_vpc.vpc_id}"
    subnet_cidr          = "192.168.1.0/24"


}

module "my_ec2" {

    source        = "../modules/ec2"
    ec2_count     = "default"
    ami_id        = "default"
    instance_type = "default"
    subnet_id     = "${module.my_ec2.subnet_id}"
  
}
