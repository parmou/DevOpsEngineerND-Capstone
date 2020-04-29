# Capstone Project DevOps Engineer ND

The final project demostrates the concept of CI/CD

1. A Jenkins server on the AWS EC2 which uses pipeline from the github to fetch the code, check linting   and then build the image and upload it to the Dockerhub 
2. In second part we use K8s functionality to deploy the image to the nodes

The EKS cluster is created using the eksclt utility command for which is mentioned below
For linting Hadolint is used via docker

### Command to create the eks cluster

```
eksctl create cluster --name web-resume-prod --region ap-south-1 --nodegroup-name web-resume-workers --node-type t3.micro --nodes 3 --nodes-min 1 --nodes-max 4 --ssh-access --ssh-public-key jenkins-key.pub --managed
```

### Other useful commands

Get the details of K8 cluster
```
kubectl get all
```

Get the service
```
kubectl get svc
```
Get the nodes
```
kubectl get nodes
```
Get pods
```
kubectl get pods
```
Get deployments
```
kubectl get deployments
```
Delete the objects:
```
kubectl delete deployments/web-resume svc/webapp
```

### Points to consider

aws cli and kubectl binaries should be present at the ``` /usr/local/bin/ ``` path for jenkins user to recognize them 
