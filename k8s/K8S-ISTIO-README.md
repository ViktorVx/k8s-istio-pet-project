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
