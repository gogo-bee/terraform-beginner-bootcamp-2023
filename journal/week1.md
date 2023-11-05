# Terraform Beginner Bootcamp 2023 - Week 1

## Fixing Tags

[How To Delete Local and Remote Tags on Git](https://devconnected.com/how-to-delete-local-and-remote-tags-on-git/)

Delete a local git tag
```sh
 git tag -d <tag_name>
```

Delete a remote git tag
```sh
$ git push --delete origin tagname
```

Checkout the commit that you want to retag. Grab the SHA from your github history.

```sh
git checkout <SHA>
git tag M.M.P (Major Minor Patch) eg 1.0.0
git push --tags
git checkout main
```

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


## Dealing with Configuration Drift

## What Happens If We Lose Our State File?

If you lose your state file `terraform.tfstate` you most likely have to tear down all your cloud infrastructure manually.

You can use terraform import but it wont work for all cloud resources. You need to chech the terraform providers documentation for which resources support import.

### Fix Missing Resources With Terraform Import

`terraform import aws_s3_bucket.bucket bucket-name`

[Terraform Import](https://developer.hashicorp.com/terraform/cli/import)

[AWS s3 Bucket Import](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket#import)

### Fix Manual Configuration

Terraform always checks the state of resorces.

If someone goes and deletes or modifies cloud resources manually through ClickOps. 

If we run Terraform Plan `terraform plan` it will attempt to put our infrastructure back into the expected state fixing Configuration Drift

### Fix Using Terraform Refresh

```sh
terraform apply -refresh-only -auto-approve
```


## Terraform Modules

### Terraform Module Structure

It is recommended to place modules in a `modules` directory (folder) when locally developing modules but you can name it whatever you like.

### Passing Input Variables

We can pass input variables to our module
The modules has to declare the terrform variables in its own variables.tf

``` tf
module "terrahouse_aws" {
  source = "./modules/terrahouse_aws"
  user_uuid = var.user_uuid
  bucket_name = var.bucket_name
}
```

### Modules Sources

We can import module within a resource 

Using the source we import module from various places eg:
- Locally
- Github
- Terraform Registry

``` tf
module "terrahouse_aws" {
  source = "./modules/terrahouse_aws"
 
}
```

[Module Sources](https://developer.hashicorp.com/terraform/language/modules/sources)

## Consideration When Using ChatGPT To Write Terraform 

Large Language Modules (LLMs) such as ChatGPT may not be trained on the latest documentations or informations about Terraform.

It may likely generate older examples that could be deprecated. Often affecting providers.

## Working With Files In Terraform

### Fileexists Function

This is a built in terraform fuction to check the existence of a file eg

```tf 
condition = fileexists(var.error_html_filepath)
```

[Fileexist Function](https://developer.hashicorp.com/terraform/language/functions/fileexists)

### Filemd5

```tf
 etag = filemd5(var.error_html_filepath)
```

[Filemd Function](https://developer.hashicorp.com/terraform/language/functions/filemd5)

### Path Variable

In terraform there is a special variable called `path` that allows us to reference local paths:
- path.module = get the path for the current module
- path.root = get the path for the root module

[Special Path Variable](https://developer.hashicorp.com/terraform/language/expressions/references)

resource "aws_s3_object" "index_html" {
  bucket = aws_s3_bucket.website_bucket.bucket
  key    = "index.html"
  source = "${path.root}/public/index.html"
}


## Terraform Locals

Locals allows us to define local variables.
It can be very useful when we need to transform data into another format and have referenced a variable.

```tf
locals {
  s3_origin_id = "myS3Origin"
}
```

[Local Values](https://developer.hashicorp.com/terraform/language/values/locals)

### Terraform Data Sources

This allows us to source data from cloud resources.

This is useful when we want to reference cloud resources without importing them.

```tf
data "aws_caller_identity" "current" {}

output "account_id" {
  value = data.aws_caller_identity.current.account_id
}
```

[Data Sources](https://developer.hashicorp.com/terraform/language/data-sources)

## Working With JSON

We use the jsonencode to create the json policy inline in the hcl.

```tf
> jsonencode({"hello"="world"})
{"hello":"world"}
```

[jsonencode](https://developer.hashicorp.com/terraform/language/functions/jsonencode)