# Terraform Beginner Bootcamp 2023 - Week 1

## Root Module Structure

Our Root Module Structure is as follows:

```
PROJECT_ROOT

├── main.tf             ; everything else
├── variables.tf        ; stores the structure of input variables
├── terraform.tfvars    ; the data of variables we want to load into our Terraform project
├── outputs.tf          ; stores our outputs
├── providers.tf        ; defines required providers and their configuration
└── README.md           ; required for root modules
```

[Standard Module Structure](https://developer.hashicorp.com/terraform/language/modules/develop/structure)

## Terraform And Input Variables

### Terraform Cloud Variables

In terraform we can set two kind of variables:
- Environment Variables - those that you will set in your bash terminal eg AWS Credentials
- Terraform Variables - those that you will normally set in your tfvars file

We can set Cloud Variables to be sensitive so they are not shown visibly in the UI.

### Loading Terraform Input Variables

[Terraform Input Variables](https://developer.hashicorp.com/terraform/language/values/variables)

### var flag

We can use the `var` flag to set an input variable or override a variable in the tfvars file eg `terraform plan -var user_uuid="my-user-id'`

### var-file flag

### terraform tfvars

This is the default file to load in terraform variables in block

### auto.tfvars

### order of terraform variables
Research
