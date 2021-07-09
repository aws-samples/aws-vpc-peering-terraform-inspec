// Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
// SPDX-License-Identifier: MIT-0

resource "aws_vpc_peering_connection" "peers" {
  for_each = local.peers
  vpc_id = data.aws_vpc.vpcs[each.value[0]].id
  peer_vpc_id = data.aws_vpc.vpcs[each.value[1]].id
  auto_accept = true

  accepter {
    allow_remote_vpc_dns_resolution = true
  }

  requester {
    allow_remote_vpc_dns_resolution = true
  }

  tags = {
    Name = "${each.value[0]}-${each.value[1]}-vpc-peer"
  }
}
