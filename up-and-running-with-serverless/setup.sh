#!/bin/bash
ENDPOINT="https://75ls82iwa3.execute-api.us-east-2.amazonaws.com/get-credentials"
RESULT=$( curl -s "$ENDPOINT" )
mkdir ~/.aws
touch ~/.aws/credentials
echo "[default]" >> ~/.aws/credentials
echo "aws_access_key_id=$( echo $RESULT | jq -r .key )" >> ~/.aws/credentials
echo "aws_secret_access_key=$( echo $RESULT | jq -r .secret )" >> ~/.aws/credentials
