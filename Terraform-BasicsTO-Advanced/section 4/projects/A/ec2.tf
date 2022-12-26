module vpcmodule {
  source = "../../modules/vpc"

}

module ec2module {
  source = "../../modules/ec2"
  subnet_id = module.vpcmodule.main_subnet_id

}

