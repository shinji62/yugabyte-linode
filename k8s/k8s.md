# Deploying YBA in Kubernetes environment

This is just a documentation for now, no IaC yet.


# Steps

## Create a Kubernetes cluster

Create a cluster in Linode is quite easy login to [Linode Cloud Manager](https://cloud.linode.com/)

Then go the Kubernetes pages > [Create cluster](https://cloud.linode.com/kubernetes/create)

I will advise you to create 4 nodes to have enough CPU / Memory

![image](<assets/Screenshot 2023-06-23 at 10.46.03.png>)



Once the cluster created, download the kubeconfig file, then you should be able to deploy Yugabyte Anywhere using the helm charts. 
For disk you can use the following storage class `linode-block-storage-retain` ,you can create a helm chart override file as:


yba-value.yml

```yaml
yugaware:
  storageClass: "linode-block-storage-retain"
  storage: "200Gi"
```

then deploy using the command 

```shell
 helm upgrade --install yw-test yugabytedb/yugaware --version 2.18 -n yb-platform --values yba-value.yml
```

You need to install kube-stats metrics for the metrics as well

```shell
helm install -n kube-system --version 5.0.0 kube-state-metrics prometheus-community/kube-state-metrics 
```

Now you should be able to connect to your YBA instance using the IP from the service
```
kubectl get svc -n yb-platform yw-test-yugaware-ui
```


## Configure YBA
Please not forget to check the [Prerequisites](https://docs.yugabyte.com/preview/yugabyte-platform/configure-yugabyte-platform/set-up-cloud-provider/kubernetes/#prerequisites)

Go to Config>Cloud Provider>Manages Kubernetes Services.
Only change that you need are

For 
* `Kubernetes Provider Type` Please choose : Custom Kubernetes Service
* strorage class: `linode-block-storage`


![](<assets/Screenshot 2023-06-30 at 17.11.13.png>)

Linode don't have concept of AZ, so you can just put whatever you want



![](<assets/Screenshot 2023-06-30 at 17.11.03.png>)



After you should be able to create an universe