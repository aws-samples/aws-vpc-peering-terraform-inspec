// Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
// SPDX-License-Identifier: MIT-0

variable "zones" {
  default = 2
}

variable "vpcs" {
  default = {
    dev = {
      cidr = "10.0.0.0/16"
      bit_mask = 8
      private_index = 1
      public_index = 101
      nat_gateway = false
    },
    test = {
      cidr = "172.24.0.0/16"
      bit_mask = 8
      private_index = 1
      public_index = 101
      nat_gateway = false
    }
  }
}

variable "peers" {
  default = [
    [
      "dev",
      "test"]]
}
