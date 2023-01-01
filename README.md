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

# Note the name of this cluster comes from "--name-template=prod" define in build.sh file. You can change this to have 
# some other name  
```

2. Install

```shell
kubectl apply -n aerospike -f cluster.yaml
```

---

## Change defaults

### Storage Type change

This setup was created to get the Aerospike running with EBS columns. You may want to use different type of disks e.g.
GP3 or something else.

You can edit update the ```./setup/ssd.yaml```
for that.
If you change the name of the storage type then you should also change the ```./helm/ext/valuse_ebs.yaml```
(```persistenceStorage. storageClass```)

### Force Aerospike pods on specific nodes

```./helm/ext/valuse_ebs.yaml``` has define ```labels``` and ```tolerations``` which will force these Aerospike pods
on specific nodes (which has label and taints defiled).
You can do a setup in such a way that each of your Aerospike cluster can sit on different nodes by:

1. Creating node groups in K8S with specific label and taints
2. Using the same in ```./helm/ext/valuse_ebs.yaml``` file