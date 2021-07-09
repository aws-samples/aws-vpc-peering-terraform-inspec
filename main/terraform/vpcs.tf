// Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
// SPDX-License-Identifier: MIT-0

module "vpcs" {
  for_each = var.vpcs
  source = "terraform-aws-modules/vpc/aws"

  name = each.key
  cidr = each.value.cidr

  create_database_subnet_group = false
  enable_dns_hostnames = true
  enable_dns_support = true
  enable_nat_gateway = each.value.nat_gateway

  azs = [
  for i in slice(local.zones, 0, var.zones):
  data.aws_availability_zones.available.names[i]
  ]

  public_subnets = [
  for i in slice(local.zones, 0, var.zones):
  cidrsubnet(each.value.cidr, each.value.bit_mask, i + each.value.public_index)
  ]

  private_subnets = [
  for i in slice(local.zones, 0, var.zones):
  cidrsubnet(each.value.cidr, each.value.bit_mask, i + each.value.private_index)
  ]
}
