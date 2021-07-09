// Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
// SPDX-License-Identifier: MIT-0

terraform {
  required_version = ">= 0.15.0"
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = ">= 3.40.0"
    }
  }
}

provider "aws" {
  default_tags {
    tags = {
      Description = "Managed by Terraform"
    }
  }
}

