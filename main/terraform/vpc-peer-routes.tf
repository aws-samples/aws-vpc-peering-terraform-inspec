// Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
// SPDX-License-Identifier: MIT-0

resource "aws_route" "peer-public-routes" {
  for_each = local.peers_doubled
  route_table_id = data.aws_route_table.public-tables[each.key].id
  destination_cidr_block = data.aws_vpc.vpcs[each.value[1]].cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.peers[each.value[0]].id
}

resource "aws_route" "peer-private-routes" {
  for_each = local.peers_private
  route_table_id = data.aws_route_table.private-tables[each.key].id
  destination_cidr_block = data.aws_vpc.vpcs[one(each.value[1])].cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.peers[each.value[0]].id
}
