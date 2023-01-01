### Step 1
1. Setup namespace - assuming it is "aerospike"
```yaml
kubectl create namespace aerospike        
```
2. Add a storage class names ```ssd```
```shell
kubectl apply -n aerospike -f setup/ssd.yaml  
```


### Step 2
1. Generate template 
```shell
sh build.sh
```
2. Install 
```shell
kubectl apply -n aerospike -f cluster.yaml
```