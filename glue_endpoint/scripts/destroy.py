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

def main():
    '''
    Destroy Endpoint if it exist
    '''
    try:
        AWS_GLUE_API.delete_dev_endpoint(
            EndpointName=os.environ['EndpointName'])
        result = "Deleted"
    except Exception as error:
        result = str(error)

    return json.dumps({
        "EndPointName": os.environ['EndpointName'],
        "Result": result
    })

if __name__ == '__main__':
    print main()
