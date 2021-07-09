# Infrastructure as Code: From Provisioning to Testing 

## Introduction

### AWS Blog
An article was published in AWS Blog to introduce the solution in detail.

## How to Play
Both provisioning and testing would require that the default AWS region and profile be set beforehand.
Use `export` to set those environmental variables.
```bash
export AWS_DEFAULT_REGION=cn-north-1
export AWS_PROFILE=
```

### Provision
To provision the example resources, run the following:
```bash
cd main/terraform
terraform init
terraform apply -auto-approve
```

To release the resources, run:
```bash
terraform destroy -auto-approve
```

### Test with INSPEC
The following commands test that the resources are provisioned as expected with supported INSPEC commands as defined in the `profile` folder.
Make sure that the `check` command outptus no errors before running the `exec` command.
```bash
cd test/inspec
inspec vendor profile
inspec check profile
inspec exec profile --target=aws:// --input-file=input.yaml
```

The following command tests unsupported resources via bash scripts,
which delegate to AWS CLI invocation to retrieve the information.
```bash
cd test/inspec
inspec vendor extension
inspec check extension
inspec exec extension --input-file=input.yaml
```

## Security
See [CONTRIBUTING](CONTRIBUTING.md#security-issue-notifications) for more information.

## License
This library is licensed under the MIT-0 License. See the LICENSE file.
