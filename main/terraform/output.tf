// Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
// SPDX-License-Identifier: MIT-0

output "dev-vpc-id" {
  value = data.aws_vpc.vpcs["dev"].id
}

output "dev-vpc-cidr" {
  value = data.aws_vpc.vpcs["dev"].cidr_block
}

output "test-vpc-id" {
  value = data.aws_vpc.vpcs["test"].id
}

output "test-vpc-cidr" {
  value = data.aws_vpc.vpcs["test"].cidr_block
}

output "peer-id" {
  value = aws_vpc_peering_connection.peers[0].id
}

output "dev-public-route-table-id" {
  value = data.aws_route_table.public-tables["dev"].id
}

output "test-public-route-table-id" {
  value = data.aws_route_table.public-tables["test"].id
}
