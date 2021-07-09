#!/bin/bash

# Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
# SPDX-License-Identifier: MIT-0

function verify() {
  local output
  case $ACTION in
  "State")
    output=$(aws ec2 describe-vpc-peering-connections \
      --filters Name=vpc-peering-connection-id,Values=$ID \
      --query 'VpcPeeringConnections[0].Status.Message' \
      --output text \
      --profile $PROFILE)
    [[ "$output" == "$VALUE" ]] && exit 0 || exit 1
    ;;
  "AccepterVpc")
    output=$(aws ec2 describe-vpc-peering-connections \
      --filters Name=vpc-peering-connection-id,Values=$ID \
      --query 'VpcPeeringConnections[0].AccepterVpcInfo.VpcId' \
      --output text \
      --profile $PROFILE)
    [[ "$output" == "$VALUE" ]] && exit 0 || exit 1
    ;;
  "RequesterVpc")
    output=$(aws ec2 describe-vpc-peering-connections \
      --filters Name=vpc-peering-connection-id,Values=$ID \
      --query 'VpcPeeringConnections[0].RequesterVpcInfo.VpcId' \
      --output text \
      --profile $PROFILE)
    [[ "$output" == "$VALUE" ]] && exit 0 || exit 1
    ;;
  esac
}

while getopts a:i:p:r:v: option; do
  case "${option}" in
  a) ACTION=${OPTARG} ;;
  i) ID=${OPTARG} ;;
  p) PROFILE=${OPTARG} ;;
  r) REGION=${OPTARG} ;;
  v) VALUE=${OPTARG} ;;
  *) exit 1 ;;
  esac
done

export AWS_PROFILE=${PROFILE}
export AWS_DEFAULT_REGION=${REGION}

verify
