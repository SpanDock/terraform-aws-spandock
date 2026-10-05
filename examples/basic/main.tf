provider "aws" {
  region = "eu-west-1"
}

module "spandock" {
  source = "../.."

  name          = "spandock-hub"
  instance_type = "t3.medium"
}

output "activation" {
  value = module.spandock.activation
}
