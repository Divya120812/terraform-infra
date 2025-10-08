bucket         = "dev-terraform-infra-tf-statefiles"
key            = "vpc-ec2/dev.tfstate"
region         = "us-east-1"
dynamodb_table = "dev-terraform-infra-tf-lock"
encrypt        = true
