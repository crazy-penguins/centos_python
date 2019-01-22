from __future__ import print_function
import boto3
import uuid
boto3.setup_default_session(region_name='us-east-2')
sts = boto3.client('sts')
session_name = 'codebuild-%s' % (uuid.uuid4().hex,)
response = sts.assume_role(
    RoleArn='arn:aws:iam::746571731253:role/leaseco-deploy-writer',
    RoleSessionName=session_name)
print('response: %s', response)
