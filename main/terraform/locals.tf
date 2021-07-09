// Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
// SPDX-License-Identifier: MIT-0

locals {
  // there are usually at most three zones
  zones = [
    0,
    1,
    2]

  zone_names = toset(slice(data.aws_availability_zones.available.names, 0, var.zones))

  peers = tomap({for i, pair in var.peers: i => pair})
  peers_doubled = merge([for i, peer in var.peers: tomap({
    (peer[0]) = [
      i,
      peer[1]],
    (peer[1]) = [
      i,
      peer[0]]
  })]...)

  peers_private = merge([for i, peer in var.peers:
  merge([for pair in setproduct(peer, local.zone_names): tomap({
    "${pair[0]}-private-${pair[1]}" = [
      i,
      setsubtract(peer, [
        pair[0]])]
  })]...)]...)
}
