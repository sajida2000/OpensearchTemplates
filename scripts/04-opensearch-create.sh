aws opensearch create-domain \
  --cli-input-json  file://es_domain.json

# ----------------------------------------------------------------------------------------------------
# ----------------------------------------------------------------------------------------------------

if [ $(aws opensearch describe-domain --domain-name ${ES_DOMAIN_NAME} --query 'DomainStatus.Processing') == "false" ]
  then
    tput setaf 2; echo "The Amazon OpenSearch cluster is ready"
  else
    tput setaf 1;echo "The Amazon OpenSearch cluster is NOT ready"
fi

# ----------------------------------------------------------------------------------------------------
# ----------------------------------------------------------------------------------------------------
