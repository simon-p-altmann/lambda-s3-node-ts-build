# Terraform build for nodejs ts lambda to s3 bucket

Clones a copy of the latest from

```
git@github.com:simon-p-altmann/lambda-s3-node-ts.git
```

builds, zips and then deploys to aws.

## Commands

```
terrform init
terraform apply
terraform destroy
```

terraform refresh if you get bad signatures on aws provider

## scripts

### git-lambda-build

bash script which clones a repo locally to a repo dir
builds the nodejs typescript project
creates a zip file of the project called lambda.zip

### aws-list-services

bash script which uses aws cli to list aws services in region
