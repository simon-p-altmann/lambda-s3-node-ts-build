#!/bin/bash

# Set the default AWS region
AWS_REGION="ap-southeast-2"

# List AWS Lambda functions
echo "Listing AWS Lambda functions in region $AWS_REGION..."
aws lambda list-functions --region $AWS_REGION

# List S3 buckets
echo "Listing S3 buckets..."
aws s3 ls

# List objects in each S3 bucket
echo "Listing objects in S3 buckets..."
buckets=$(aws s3api list-buckets --query "Buckets[].Name" --output text)
for bucket in $buckets; do
    echo "Objects in bucket $bucket:"
    aws s3 ls s3://$bucket
done


# List DynamoDB tables
echo "Listing DynamoDB tables in region $AWS_REGION..."
aws dynamodb list-tables --region $AWS_REGION

# List AppSync GraphQL APIs
echo "Listing AppSync GraphQL APIs in region $AWS_REGION..."
aws appsync list-graphql-apis --region $AWS_REGION

echo "AWS CLI commands executed successfully."
