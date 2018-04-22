#!/usr/bin/env bash
rm ami-latest.txt
export AWS_DEFAULT_REGION=us-east-1

aws ec2 describe-images \
 --owners amazon \
 --filters Name=name,Values=ubuntu-xenial-16.04-amd64-server-dotnetcore-* \
 --query 'Images[*].[ImageId,CreationDate]' --output text \
 | sort -k2 -r \
 | head -n1 >> dotnet-latest.txt


aws ec2 describe-images --owners amazon --filters "Name=name,Values=ubuntu-xenial-16.04-amd64-server-dotnetcore-*" "Name=root-device-type,Values=ebs" "Name=architecture,Values=x86_64" "Name=block-device-mapping.volume-type,Values=gp2" >> output.json
