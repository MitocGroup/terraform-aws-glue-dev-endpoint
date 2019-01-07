#!/usr/bin/env python
"""This code id use in Glue endpoint"""
import os
import json
import boto3

REGION = os.environ['Region']
AWS_GLUE_API = boto3.client(
    service_name='glue',
    region_name=REGION,
    endpoint_url='https://glue.{0}.amazonaws.com'.format(REGION))

def get_dev_endpoint_not_exist():
    '''
    Check if Endpoint exist
    '''
    try:
        dev_end_point = AWS_GLUE_API.get_dev_endpoint(
            EndpointName=os.environ['EndpointName'])
        return dev_end_point
    except:
        return True

def create_dev_endpoint(arguments):
    '''
    Create EndPoint
    '''
    if os.environ['PublicKeys']:
        arguments['PublicKeys'] = {
            "PublicKeys": os.environ['PublicKeys'].split(',')}
    if os.environ['ExtraPythonLibsS3Path']:
        arguments['ExtraPythonLibsS3Path'] = os.environ['ExtraPythonLibsS3Path']
    if os.environ['ExtraJarsS3Path']:
        arguments['ExtraJarsS3Path'] = os.environ['ExtraJarsS3Path']
    if os.environ['SecurityGroupIds']:
        arguments['SecurityGroupIds'] = {
            "SecurityGroupIds": os.environ['SecurityGroupIds'].split(',')}
    if os.environ['SubnetId']:
        arguments['SubnetId'] = os.environ['SubnetId']
    if os.environ['NumberOfNodes']:
        arguments['NumberOfNodes'] = int(os.environ['NumberOfNodes'])
    if os.environ['SecurityConfiguration']:
        arguments['SecurityConfiguration'] = os.environ['SecurityConfiguration']
    AWS_GLUE_API.create_dev_endpoint(**arguments)

def update_dev_endpoint(arguments, dev_end_point):
    '''
    Update EndPoint
    '''
    if os.environ['PublicKeys']:
        arguments['AddPublicKeys'] = {
            "AddPublicKeys": os.environ['PublicKeys'].split(',')}
    arguments['DeletePublicKeys'] = dev_end_point['PublicKeys']
    if os.environ['ExtraPythonLibsS3Path'] and os.environ['ExtraJarsS3Path']:
        arguments['CustomLibraries'] = {
            "CustomLibraries": {
                "ExtraPythonLibsS3Path": os.environ['ExtraPythonLibsS3Path'],
                "ExtraJarsS3Path": os.environ['ExtraJarsS3Path']}}
    AWS_GLUE_API.update_dev_endpoint(**arguments)

def main():
    '''
    Create or Update Endpoint
    '''
    arguments = {
        "EndpointName": os.environ['EndpointName'],
        "RoleArn": os.environ['RoleArn']
    }
    if os.environ['PublicKey']:
        arguments['PublicKey'] = os.environ['PublicKey']
    dev_end_point = get_dev_endpoint_not_exist()
    if dev_end_point:
        try:
            create_dev_endpoint(arguments)
            result = "Created"
        except Exception as error:
            result = str(error)
    else:
        try:
            update_dev_endpoint(arguments, dev_end_point)
            result = "Updated"
        except Exception as error:
            result = str(error)
    return json.dumps({
        "EndPointName": os.environ['EndpointName'],
        "Result": result
    })

if __name__ == '__main__':
    print main()
