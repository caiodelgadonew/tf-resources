# Deploy in AWS with Terraform

There's many ways of deploying the terraform code. For all of them you need Terraform CLI version `~> 1.0.0`, which stands for allowing only the _rightmost_ version increment.

> This version constraint is set because of an existing bug of Terraform CLI that affects versions `v1.1.0` and `1.1.1`, the [changelog for version 1.1.2](https://github.com/hashicorp/terraform/releases/tag/v1.1.2) says that it was fixed but the problem is still there and a issue is opened for it [#30266](https://github.com/hashicorp/terraform/issues/30266).


1. Install [terraform v1.0.11](https://releases.hashicorp.com/terraform/1.0.11/) or any version that satisfies the constraints.
2. Configure your aws credentials, refer to the [AWS Documentation](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-files.html) or [AWS Provider documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs#authentication)

## Deployment

To create the infrastructure, go to the `infra/` folder and issue the following commands:
```bash
$ terraform init
$ terraform apply 
```

The default region is set as `eu-central-1`, if you want to deploy in a different version you can issue the command `terraform apply -var="region=us-east-1"` for example if you want to deploy in `us-east-1`, or change it into the `variable.tf` file.

> **WARNING:** Resources running on AWS costs money, be sure to remove them if you dont need it anymore with the command `terraform destroy`

### What does this code creates?

With this code you'll create:
- S3 Bucket
- 2 IAM Admin users and a group with the AdministratorAccess Policy
- 1 IAM Application user with Read/Write access to the S3 bucket.
- 2 VPCS (Staging and Production)
- 2 Public subnets in each VPC
- 2 Private subnets in each VPC 
