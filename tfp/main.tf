module "vpc" {
  source = "./modules/vpc"
}

module "security-group" {
  source     = "./modules/security-group"
  new_vpc_id = module.vpc.vpc_id
}

module "webservers" {
  source    = "./modules/webservers"
  sg_id     = module.security-group.sg_output
  pub_sn_id = module.security-group.sn_id
}

