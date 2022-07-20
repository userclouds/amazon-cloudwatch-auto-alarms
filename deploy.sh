#!/usr/bin/env bash

echo "you need to have valid AWS creds in your session, source tools/aws-mfa.sh in main repo if not already"

zip -j amazon-cloudwatch-auto-alarms.zip src/*

aws s3 cp amazon-cloudwatch-auto-alarms.zip s3://amazon-cloudwatch-auto-ala-lambdadeploymentbucket-1h76ytps4s5ir

echo "done...I think"