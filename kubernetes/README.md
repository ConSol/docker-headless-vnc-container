# Kubernetes usage of "headless" VNC Docker images

The following content uses as example the image `consol/centos-xfce-vnc` of the Dockerfile [`Dockerfile.centos.xfce.vnc`](../Dockerfile.centos.xfce.vnc).

## Deploy one pod of `centos-xfce-vnc` image and expose a service
 
On an already logged in Kubernetes cluster just use the predefined deployment with service config [`kubernetes.headless-vnc.example.deployment.yaml`](kubernetes.headless-vnc.example.deployment.yaml): 

    kubectl apply -f  kubernetes/kubernetes.headless-vnc.example.deployment.yaml
    
Now a new pod with corresponding service should spin up with `ContainerCreating`:

```bash
kubectl get pods --output=wide

NAME                            READY     STATUS              RESTARTS   AGE       IP        NODE
headless-vnc-7f6bc46c84-hrhc2   0/1       ContainerCreating   0          28s       <none>    kubermatic-s9g9frstlk-n7tw6
```    

After a while the kublet will have downloaded the imaged and started - shown as `Running`:

```bash
kubectl get pods --output=wide

NAME                            READY     STATUS    RESTARTS   AGE       IP           NODE
headless-vnc-7f6bc46c84-hrhc2   1/1       Running   0          3m        172.25.2.3   kubermatic-s9g9frstlk-n7tw6
```
**ATTENTION:** the above shown IP the cluster **INTERNAL** one!

Due to the following service configuration, the service will be exposed as type `NodePort`, this means that the service will accessible through the IP of the Kubernetes node and the exposed `nodePort`.

```yaml
apiVersion: v1
kind: Service
metadata:
  labels:
    application: headless-vnc
  name: headless-vnc
spec:
  externalName: headless-vnc
  ports:
  - name: http-port-tcp
    protocol: TCP
    port: 6901
    targetPort: 6901
    nodePort: 32001
#...
  selector:
    application: headless-vnc
  type: NodePort

```
In this case you have to determine the **EXTERNAL IP** of the node `kubermatic-s9g9frstlk-n7tw6`. The you can connect to the pod via [http://<ip-of-node>:32001/?password=vncpassword](http://<ip-of-node>:32001/?password=vncpassword).

## Delete deployment

Execute the command:

    kubectl delete -f kubernetes/kubernetes.headless-vnc.example.deployment.yaml