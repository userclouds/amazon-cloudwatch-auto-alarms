#!/usr/bin/env bash

echo "you need to have valid AWS creds in your session, run "
echo ""
echo "aws sso login"
echo ""
echo "and then run"
echo ""
echo 'eval "$(aws configure export-credentials --profile example-profile --format env)"'
echo ""
echo "and don't forget to clean them up when you're done :)"

zip -j amazon-cloudwatch-auto-alarms.zip src/*

# we push to s3 just in case because that's how the CloudFormation template loaded the orig code
aws s3 cp amazon-cloudwatch-auto-alarms.zip s3://amazon-cloudwatch-auto-ala-lambdadeploymentbucket-1h76ytps4s5ir
aws s3 cp amazon-cloudwatch-auto-alarms.zip s3://amazon-cloudwatch-auto-ala-lambdadeploymentbucket-15ts8cpkxpho3

# this seems to be easier to get lambda to load the code
aws --region us-east-1 lambda update-function-code --function-name CloudWatchAutoAlarms --zip-file fileb://amazon-cloudwatch-auto-alarms.zip
aws --region us-west-2 lambda update-function-code --function-name CloudWatchAutoAlarms --zip-file fileb://amazon-cloudwatch-auto-alarms.zip

echo "done...I think"