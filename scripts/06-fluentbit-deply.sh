#Deploy fluent-bit
kubectl apply -f fluentbit.yaml

#Check the fluent-bit pods already created. the total number of pods will be equal to the number of nodes
kubectl get pods -n logging
