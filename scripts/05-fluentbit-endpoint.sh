eksctl get iamserviceaccount --cluster ${YOUR_CLUSTER_NAME} --namespace logging -o json

#After that, copy the roleARN value for example
arn:aws:iam::012345678910:role/your-cluster-name-addon-iamservice-Role1-A1B2C3D4E5F6

#Export this arn to FLUENTBIT_ROLE varaible
export FLUENTBIT_ROLE=arn:aws:iam::012345678910:role/your-cluster-name-addon-iamservice-Role1-A1B2C3D4E5F6

# Get the Amazon OpenSearch Endpoint
export ES_ENDPOINT=$(aws opensearch describe-domain --domain-name ${ES_DOMAIN_NAME} --output text --query "DomainStatus.Endpoint")

# Update the Opensearch internal database
curl -sS -u "${ES_DOMAIN_USER}:${ES_DOMAIN_PASSWORD}" \
    -X PATCH \
    https://${ES_ENDPOINT}/_opendistro/_security/api/rolesmapping/all_access?pretty \
    -H 'Content-Type: application/json' \
    -d'
[
  {
    "op": "add", "path": "/backend_roles", "value": ["'${FLUENTBIT_ROLE}'"]
  }
]
'