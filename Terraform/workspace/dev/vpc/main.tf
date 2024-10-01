module "vpc" {
  source = "../../../modules/vpc"

  cidr           = "10.0.0.0/16"
  public_subnet_1 = "10.0.1.0/24"
  public_subnet_2 = "10.0.2.0/24"
  az_1           = "us-east-1a"
  az_2           = "us-east-1b"
}