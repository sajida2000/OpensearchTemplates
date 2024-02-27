#Export variable ES_DOMAIN_NAME to make easier later
export ES_DOMAIN_NAME="eks-app-logging" 
export YOUR_AWS_REGION="your-region-code"
export YOUR_ACCOUNT_ID="567123489011"
export YOUR_EKS_CLUSTER="your-eks-cluster-name"
export ES_VERSION="OpenSearch_2.7"
export ES_DOMAIN_USER="your-user-name"
export ES_DOMAIN_PASSWORD="$(openssl rand -base64 15)_Ek1$"
