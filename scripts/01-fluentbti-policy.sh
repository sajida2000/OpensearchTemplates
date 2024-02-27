#Create json file for fluent-bit-policy
cat <<EoF > fluent-bit-policy.json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": [
                "es:ESHttp*"
            ],
            "Resource": "arn:aws:es:${YOUR_AWS_REGION}:${YOUR_ACCOUNT_ID}:domain/${ES_DOMAIN_NAME}",
            "Effect": "Allow"
        }
    ]
}
EoF

#Create IAM policy
aws iam create-policy   \
  --policy-name fluent-bit-policy \
  --policy-document file://fluent-bit-policy.json