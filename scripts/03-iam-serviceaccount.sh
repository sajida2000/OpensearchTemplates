eksctl create iamserviceaccount \
    --name fluent-bit \
    --namespace logging \
    --cluster ${YOUR_EKS_CLUSTER}\
    --attach-policy-arn "arn:aws:iam::${YOUR_ACCOUNT_ID}:policy/fluent-bit-policy" \
    --approve \
    --override-existing-serviceaccounts

#Check service account is created
kubectl describe sa fluent-bit -n logging