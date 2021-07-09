// Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
// SPDX-License-Identifier: MIT-0

data "aws_availability_zones" "available" {
  state = "available"
}

data "aws_vpc" "vpcs" {
  for_each = var.vpcs
  depends_on = [
    module.vpcs]
  filter {
    name = "tag:Name"
    values = [
      each.key]
  }
}

data "aws_route_table" "public-tables" {
  depends_on = [
    module.vpcs]
  for_each = var.vpcs
  filter {
    name = "tag:Name"
    values = [
      "${each.key}-public"]
  }
}

data "aws_route_table" "private-tables" {
  depends_on = [
    module.vpcs]
  for_each = local.peers_private
  filter {
    name = "tag:Name"
    values = [
      each.key]
  }
}
