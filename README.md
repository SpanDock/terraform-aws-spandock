# SpanDock server on AWS (EC2)

A Terraform module that runs a [SpanDock](https://www.spandock.com) server: a hub, or a satellite that joins one. Ubuntu 24.04, an encrypted disk, no inbound port unless you ask for SSH; SpanDock is installed by cloud-init as a systemd service.

```hcl
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
  value = module.spandock.activation
}
```

A new hub prints an activation link on its first start: approve it once on spandock.com. The `activation` output says where to read it. To add a satellite, pass `join_code` (from the hub: Settings → Scaling → Add server).

Inputs are in `variables.tf`, outputs in `outputs.tf`, and a complete example in `examples/basic`. Full guide: https://www.spandock.com/docs/deploy

This repository is generated from SpanDock's deploy kits (https://github.com/SpanDock/spandock-deploy); open issues there. Licensed under Apache-2.0.
