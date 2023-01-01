 helm template ./helm/ --name-template=prod -n aerospike -f ./helm/values.yaml -f ./helm/ext/values_ebs.yaml --set dbReplicas=3 > cluster.yaml
