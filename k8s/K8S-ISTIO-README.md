### Minikube
#### Docs https://kubernetes.io/ru/docs/tutorials/hello-minikube/
Start minikube cluster
```shell
mimikube start
```
Start minikube dashboard on
http://127.0.0.1:38573/api/v1/namespaces/kubernetes-dashboard/services/http:kubernetes-dashboard:/proxy/#/workloads?namespace=default
```shell
minikube dashboard
```
Create deployment
```shell
kubectl create deployment k8s-istio-pet-project --image=docker.io/viktorvx/k8s-istio-pet-project:0.0.1-SNAPSHOT
```
Create service for deployment
```shell
kubectl expose deployment k8s-istio-pet-project --type=LoadBalancer --port=8081
```
### Istio
#### Install istio to minikube https://istio.io/latest/docs/setup/getting-started/#bookinfo

### Deploy app to k8s+istio
Apply configs
```shell
kubectl config set-context --current --namespace=k8s-istio-pet-project-ns
kubectl label namespace k8s-istio-pet-project-ns istio-injection=enabled
kubectl apply -f k8s-istio-pet-project.yaml 
kubectl get svc istio-ingressgateway -n istio-system
export INGRESS_HOST=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.status.loadBalancer.ingress[0].ip}')
export INGRESS_PORT=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="http2")].port}')
export GATEWAY_URL=$INGRESS_HOST:$INGRESS_PORT
echo $GATEWAY_URL
curl -v http://$GATEWAY_URL/hello-world/hello
```
Hint! Open access from system to istio https://minikube.sigs.k8s.io/docs/handbook/accessing/#using-minikube-tunnel
```shell
minikube tunnel
```
