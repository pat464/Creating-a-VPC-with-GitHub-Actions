module "vpc" {
  source       = "./Modules/vpc"
  vpc_cidr     = var.vpc_cidr
  subnets_cidr = var.subnets_cidr
}
#Security-Group
module "SG" {
  source = "./Modules/Security-Group"
  vpc_id = module.vpc.vpc_id
}
#EC2
module "EC2" {
  source    = "./Modules/EC2"
  ec2_sg_id = module.SG.ec2_sg_id
  Subnets   = module.vpc.subnets_ids
}
#ALB
module "ALB" {
  source    = "./Modules/ALB"
  alb_sg_id = module.SG.alb_sg_id
  subnets   = module.vpc.subnets_ids
  vpc_id    = module.vpc.vpc_id
  instances = module.EC2.instances
}