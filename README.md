# CI-CD-pipeline-for-microservice-application
Capstone Project [Udacity Cloud DevOps Engineer Nanodegree]

## Project Overview
### Project Description
Develop a CI/CD pipeline for microservice application with blue/green deployment. Start with a linting check, push the built Docker conatiner(s) to the Docker repositiry, and then deploy these Docker container(s) to a small Kubernetes cluster.

### Project Procedure
- Lauch a EC2 instance
  - AMI: Ubuntu Server 18.04 LTS
- Install required dependencies
  - Jenkins
  - Docker
  - pip
  - AWS CLI
  - eksctl
  - kubectl
  - lint
- Install required plugins in Jenkins
  - Blue Ocean
  - Pipeline AWS steps
  - Kubernetes
- Build pipeline
  - Docker containers
  - Kubernetes cluster

### Project Results
1. Jenkins pipeline after finishing deployment
<img src="images/Jenkins_pipeline.png">

2. Test lint failure in Jenkins pipeline
<img src="images/Lint_failure.png">

3. AWS EC2 insatnces after finishing deployment
<img src="images/AWS_EC2.png">

4. AWS EKS cluster
<img src="images/CloudFormation_stacks.png">

5. AWS CloudFormation stacks
<img src="images/EKS_cluster.png">

6. Web page
<img src="images/Web_page.png">
