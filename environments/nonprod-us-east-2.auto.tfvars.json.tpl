{
  "cluster_name": "nonprod-us-east-2",
  "aws_region": "us-east-2",
  "assume_role": "DPSPlatformVPCRole",
  "account_id": "{{ op://empc-lab/cohort-base-aws-1/aws-account-id }}",
  "vpc_cidr": "10.50.0.0/16",
  "vpc_azs": ["us-east-2a","us-east-2b","us-east-2c"],
  "vpc_private_subnets": ["10.50.0.0/19", "10.50.32.0/19", "10.50.64.0/19"],
  "vpc_public_subnets": ["10.50.96.0/24", "10.50.97.0/24", "10.50.98.0/24"],
  "vpc_intra_subnets": ["10.50.100.0/23", "10.50.102.0/23", "10.50.104.0/23"],
  "vpc_database_subnets": ["10.50.106.0/23", "10.50.108.0/23", "10.50.110.0/23"]
}
