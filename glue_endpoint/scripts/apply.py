#!/usr/bin/env python
"""This code id use in Glue endpoint"""
import sys
import json
import boto3

ARGS = json.load(sys.stdin)
REGION = ARGS['Region']
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
            EndpointName=ARGS['EndpointName'])
        return dev_end_point
    except:
        return True

def create_dev_endpoint(arguments):
    '''
    Create EndPoint
    '''
    if ARGS['PublicKeys']:
        arguments['PublicKeys'] = {
            "PublicKeys": ARGS['PublicKeys'].split(',')}
    if ARGS['ExtraPythonLibsS3Path']:
        arguments['ExtraPythonLibsS3Path'] = ARGS['ExtraPythonLibsS3Path']
    if ARGS['ExtraJarsS3Path']:
        arguments['ExtraJarsS3Path'] = ARGS['ExtraJarsS3Path']
    if ARGS['SecurityGroupIds']:
        arguments['SecurityGroupIds'] = {
            "SecurityGroupIds": ARGS['SecurityGroupIds'].split(',')}
    if ARGS['SubnetId']:
        arguments['SubnetId'] = ARGS['SubnetId']
    if ARGS['NumberOfNodes']:
        arguments['NumberOfNodes'] = int(ARGS['NumberOfNodes'])
    if ARGS['SecurityConfiguration']:
        arguments['SecurityConfiguration'] = ARGS['SecurityConfiguration']
    AWS_GLUE_API.create_dev_endpoint(**arguments)

def update_dev_endpoint(arguments, dev_end_point):
    '''
    Update EndPoint
    '''
    if ARGS['PublicKeys']:
        arguments['AddPublicKeys'] = {
            "AddPublicKeys": ARGS['PublicKeys'].split(',')}
    arguments['DeletePublicKeys'] = dev_end_point.get('PublicKeys')
    if ARGS['ExtraPythonLibsS3Path'] and ARGS['ExtraJarsS3Path']:
        arguments['CustomLibraries'] = {
            "CustomLibraries": {
                "ExtraPythonLibsS3Path": ARGS['ExtraPythonLibsS3Path'],
                "ExtraJarsS3Path": ARGS['ExtraJarsS3Path']}}
    AWS_GLUE_API.update_dev_endpoint(**arguments)

def main():
    '''
    Create or Update Endpoint
    '''
    arguments = {
        "EndpointName": ARGS['EndpointName'],
        "RoleArn": ARGS['RoleArn']
    }
    if ARGS['PublicKey']:
        arguments['PublicKey'] = ARGS['PublicKey']
    dev_end_point = get_dev_endpoint_not_exist()
    if dev_end_point:
        exist = "False"
        try:
            create_dev_endpoint(arguments)
            result = "Created"
        except Exception as error:
            result = str(error)
    else:
        exist = "True"
        try:
            update_dev_endpoint(arguments, dev_end_point)
            result = "Updated"
        except Exception as error:
            result = str(error)
    return json.dumps({
        "EndPointName": ARGS['EndpointName'],
        "Result": result,
        "Exist": exist
    })

if __name__ == '__main__':
    print main()
