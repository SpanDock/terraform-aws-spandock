provider "aws" {
  region = "eu-west-1"
}

module "spandock" {
  source  = "SpanDock/spandock/aws"
  version = "~> 1.0"

  name          = "spandock-hub"
  instance_type = "t3.medium"
}

output "activation" {
  description = "How to find the link that activates the new hub."
  value       = module.spandock.activation
}
