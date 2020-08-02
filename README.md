# Complete DevOps Pipeline - Capstone Udacity

#### This is the capstone project from udacity

Contents

##### 1. Setup Infrastructure using AWS CloudFormation which includes:

 - **Networking Setup**
 	- VPC
 	- Public and Private Subnets
 	- InternetGateway
 	- NAT Gateway
 	- Route Tables

 - **Compute Setup**
 	- Security Groups
 	- EC2 Controller Node

##### 2. Configured controller node using Ansible:

 - **Installed packages**
 	- Python
 	- AWS-CLI v2
 	- Jenkins
 	- kubectl
 	- Docker

### Steps to run this project:

**Prerequisites**

- `AWS free tier` account
- `aws-cli` must be configured on your system for executing cloudformation scripts 
- Familiar with `bash` scripts

**Steps**

##### Local Setup

1. Login to you **AWS Console** and go to **EC2** section in **us-east-1** region
2. Go to KeyPair section and create a new KeyPair with the name **udacity-project** and then you'll have **udacity-project.pem** file on your local at destination ***~/Downloads/udacity-project.pem***. Make sure it is on this path only.
3. Run **`aws configure`** and add your **access key** and **secret key** and use region **us-east-1**

##### Setting Up Infra

4. Now run **`bash create-infra.sh`**. Now head to **cloudFormation** service in AWS Console and you will see a new stack with name ***udacity-capstone*** is creating.
5. After the stack has been created, in the output section, you will get the **Public IP** of the **controller instance**.
6. Replace this IP in **roles/inventory.ini** as **`ubuntu@<public-ip>`** 

##### Turn Up EKS

7. On **AWS Console**, Go to IAM Role and create a new role for **EKS**. Now go to EKS section and create an **EKS Cluster** and **NodeGroup**. Attach **IAM Role** to your controller node for the access of **EKS Cluster**.

##### Setup Jenkins

8. Now run **`bash setup-controller.sh <public-ip>`**. This will configure the controller node by executing ansible role over the controller node and will return the **Jenkins IP** and its **InitialAdminPassword**
9. Open Jenkins and configure it. After configuring, you need to add plugins related to **BlueOcean**, **Docker** and **Pipeline: AWS Steps**.
10. After adding the plugins, go to credentials section and add Docker Credentials with the name **dockerhub-credentials**.
11. Now head to BlueOcean and create your first project pipeline by configuring this repository.

##### Run the pipeline

12. Run the pipeline and you will see that the pipeline will perform the following
 - Check Linting of the HTML
 - Build the docker image from the **dockerfile**
 - Push the docker image to *Dockerhub*
 - Deploy the image on EKS using **deployment-rolling-update.yaml**
13. Test Rolling update by changing the HTML file with some new content and trigger the **jenkins build** again.
14. You will see that the pods will go down 1 by 1 and new pods will start replacing them.
