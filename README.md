# TerraformAssignment

## Creating Infrastructure
1. Creating VPC
2. Creating subnets
3. Add routes in route table.
4. Created IGW in order to access internet on public subnets.
5. created nit gateway in order give access to internet on privet subnet VM's in secure manner.
6. Created EC2 instance - in this task i have created bastion host with public IP (you can also attach elastic ip if required using this module)
7. for instance Security Group and Iam policy required so created this two moduels as well.
8. S3 backend with dynamodb table locking is configured which is must while working in team.


```
cd environments/dev

terraform init
terraform plan
terraform apply

```

## managing dev, preprod, prod.

- we can create three different files as shown belo in order to manage three env with same resources but different configurations.

```
# dev.tfvars
region = "us-west-2"
instance_type = "t2.micro"

# prod.tfvars
region = "us-east-1"
instance_type = "t3.large"

# preprod.tfvars
region = "eu-west-1"
instance_type = "m5.large"

```

- we can used below commands in order to deploy this  dev, preprod, prod.

```
terraform apply -var-file=dev.tfvars

terraform apply -var-file=preprod.tfvars

terraform apply -var-file=prod.tfvars
```

## Used validation block in variable

- i have also used validation block in one of the variable resirict users 

```
variable "project_name" {
  description = "Name of the project"
  type        = string
  default     = "my-project"
  validation {
    condition = can(regex("^[a-zA-Z0-9-]{8,15}$", var.project_name))
    error_message = "Project name must be between 8 to 15 characters and contain only letters, numbers, and hyphens."
  }
}

```

### Instance will get public IP and if you click on public ip you will able to see Apache HTTP server page.

## add alias 

- added alias if wante to create resource in diff region while calling resource module we can add this alias variable.

```
resource "aws_instance" "ec2" {
  provider = aws.east

}

```

## Data Source

- used datasource in order to get ami value dynamically.
- also used in order to pass startup script tu ec2 instance.

## fulctions used
i have used below functions
```
merge()
length()
element()
toset()
range()
```

## Further Improvements

- In VPC module we can add NACL, and VPC endpoint creation.
- We can also imrove tagging and labeling as well.
- VPC Peerning also can be implemented.
- In EC2 module we can add ebs or efs additional volume creation functionality.
- We can also create different different variable files for different resources if file getting big.