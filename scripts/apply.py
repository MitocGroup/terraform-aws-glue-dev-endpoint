#!/usr/bin/env python
"""This code id use in Glue endpoint"""
import os
import json
import boto3

REGION = os.environ['region']
AWS_GLUE_API = boto3.client(
    service_name='glue',
    region_name=REGION,
    endpoint_url='https://glue.{0}.amazonaws.com'.format(REGION))

def get_dev_endpoint_not_exist():
    '''
    Check if Endpoint exist
    '''
    try:
        AWS_GLUE_API.get_dev_endpoint(EndpointName=os.environ['endpoint_name'])
        return False
    except:
        return True

def create_endpoint(arguments):
    '''
    Create EndPoint
    '''
    if os.environ['public_keys']:
        arguments['PublicKeys'] = {
            "PublicKeys": os.environ['public_keys'].split(',')}
    if os.environ['extra_python_libs_s3_path']:
        arguments['ExtraPythonLibsS3Path'] = os.environ['extra_python_libs_s3_path']
    if os.environ['extra_jars_s3_path']:
        arguments['ExtraJarsS3Path'] = os.environ['extra_jars_s3_path']
    if os.environ['security_group_ids']:
        arguments['SecurityGroupIds'] = {
            "SecurityGroupIds": os.environ['security_group_ids'].split(',')}
    if os.environ['subnet_id']:
        arguments['SubnetId'] = os.environ['subnet_id']
    if os.environ['number_of_nodes']:
        arguments['NumberOfNodes'] = int(os.environ['number_of_nodes'])
    if os.environ['security_configuration']:
        arguments['SecurityConfiguration'] = os.environ['security_configuration']
    if os.environ['role_arn']:
        arguments['RoleArn'] = os.environ['role_arn']
    if os.environ['tags'] =
    AWS_GLUE_API.create_dev_endpoint(**arguments)

def update_endpoint(arguments, dev_end_point):
    '''
    Update EndPoint
    '''
    if os.environ['public_keys']:
        arguments['AddPublicKeys'] = {
            "AddPublicKeys": os.environ['public_keys'].split(',')}
    if dev_end_point.get('PublicKeys'):
        arguments['DeletePublicKeys'] = dev_end_point.get('PublicKeys')
    if os.environ['extra_python_libs_s3_path'] and os.environ['extra_jars_s3_path']:
        arguments['CustomLibraries'] = {
            "CustomLibraries": {
                "ExtraPythonLibsS3Path": os.environ['extra_python_libs_s3_path'],
                "ExtraJarsS3Path": os.environ['extra_jars_s3_path']}}
    if os.environ['tags']
    AWS_GLUE_API.update_dev_endpoint(**arguments)

def main():
    '''
    Create or Update Endpoint
    '''
    arguments = {
        "EndpointName": os.environ['endpoint_name']
    }
    if get_dev_endpoint_not_exist():
        exist = "False"
        try:
            create_endpoint(arguments)
            result = "Created"
        except Exception as error:
            result = str(error)
    else:
        dev_end_point = AWS_GLUE_API.get_dev_endpoint(
            EndpointName=os.environ['endpoint_name'])
        exist = "True"
        try:
            update_endpoint(arguments, dev_end_point)
            result = "Updated"
        except Exception as error:
            result = str(error)
    return json.dumps({
        "EndpointName": os.environ['endpoint_name'],
        "Result": result,
        "Exist": exist
    })

if __name__ == '__main__':
    print main()
