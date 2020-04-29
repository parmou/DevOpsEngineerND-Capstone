# Capstone Project DevOps Engineer ND

The final project demostrates the concept of CI/CD

1. A Jenkins server on the AWS EC2 which uses pipeline from the github to fetch the code, check linting   and then build the image and upload it to the Dockerhub. For linting Hadolint image is used.
2. In second part we use K8s functionality to deploy the image to the nodes
3. The EKS cluster is created using the eksclt utility command for which is mentioned below

## Link to the project

```
https://github.com/parveshmourya/devopsnd-capstone.git
```

### Command to create the eks cluster

```
eksctl create cluster --name web-resume-prod --region ap-south-1 --nodegroup-name web-resume-workers --node-type t3.micro --nodes 3 --nodes-min 1 --nodes-max 4 --ssh-access --ssh-public-key jenkins-key.pub --managed
```

### Rolling Deployment - How it works here!

In this, we use rolling deployment as the deployment startegy. Rolling updates allow Deployments' update to take place with zero downtime by incrementally updating Pods instances with new ones. The new Pods will be scheduled on Nodes with available resources.

Rolling updates allow the following actions:

* Promote an application from one environment to another (via container image updates)
* Rollback to previous versions
* Continuous Integration and Continuous Delivery of applications with zero downtime


Command to deploy a new image in a rolling fashion
```
 kubectl set image deployments/web-resume web-resume=parveshmourya/capstone:v2
```

Command to rollback if the upgrade fails:
```
kubectl rollout undo deployments/web-resume 
```

Command to get status of rolling update:
```
kubectl rollout status deployments/web-resume 
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
