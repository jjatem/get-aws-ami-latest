#!/usr/bin/env bash
rm ami-latest.txt
export AWS_DEFAULT_REGION=us-east-1

aws ec2 describe-images \
 --owners amazon \
 --filters Name=name,Values=Windows_Server-2012-R2_RTM-English-64Bit-Base* \
 --query 'Images[*].[ImageId,CreationDate]' --output text \
 | sort -k2 -r \
 | head -n1 >> ami-latest.txt


# aws ec2 describe-images --owners amazon --filters "Name=platform,Values=windows" "Name=root-device-type,Values=ebs" "Name=architecture,Values=x86_64" "Name=block-device-mapping.volume-type,Values=gp2" >> output.json
python3.6 get-aws-ami.py