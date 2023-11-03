terraform {
  
# cloud {
 #   organization = "gogobees-projects"

  #  workspaces {
   #   name = "terra-house-1"
    #}
  #}

  required_providers {
     aws = {
      source = "hashicorp/aws"
      version = "5.23.1"
    }
  }
}

provider "aws" {
  # Configuration options
}

provider "random" {
  # Configuration options
}