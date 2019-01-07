#!/usr/bin/env python
"""This code id use in Glue endpoint"""
import sys
import json
import boto3

ARGS = json.load(sys.stdin)
ENDPOINT_NAME = ARGS['EndpointName']
REGION = ARGS['Region']
AWS_GLUE_API = boto3.client(
    service_name='glue',
    region_name=REGION,
    endpoint_url='https://glue.{0}.amazonaws.com'.format(REGION))

def main():
    try:
        AWS_GLUE_API.get_dev_endpoint(EndpointName=ENDPOINT_NAME)
        result = "True"
    except:
        result = "False"

    return json.dumps({
        "EndPointName": ENDPOINT_NAME,
        "Exist": result
    })

if __name__ == '__main__':
    print main()
