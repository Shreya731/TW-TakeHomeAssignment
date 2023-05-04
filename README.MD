
**Problem Statement: Want to automate the deployment of MediaWiki using Terraform or any IaC tool with any Configuration Management tool integrated.**
```

###Approach###

###provider.tf

This file is configured with terraform block to install the required provider with specific version from terraform registry
  

### COMPONENTS OF main.tf

1. Created Custom VPC where all the resources being hosted
2. Created 2 public subnets and 2 private subnets in two availability zones to host resources with high availabity and fault-tolerant
3. Created internet gateway to get the user's request to acccess the resources from internet
4. Created NAT gateway in public subnet to secure the resources hosted in private subnet to directly accessible from internet
5. Created route table for public and private subnet and associated it with proper subnet and route table for proper channeling of requests
6. Created application loadbalancer and its secrity groups to check the health status of hosted ec2 instance and handle the request coming from user and serve it without downtime.
7. Created Launch template with its security group for creating EC2 instance.
8. Created Auto Scaling Group to scale the EC2 instance for high availability

###variable.tf

This file is declared with all the variable used in main.tf with default values.

###output.tf

In this file the output is stored for the resources provisioned

###userdata.sh

In ths file the script is written which is passed while launching the EC2 to install servers and applications

***remote backend is created to store tfstate files***

***TO RUN THE CODE FOLLOW THE BELOW STEP***

Download AWS cli and install it

set the credentials of your AWS account using:

set AWS_ACCESS_KEY_ID=XXXXXXXXXXX
set AWS_SECRET_ACCESS_KEY=XXXXXXXXXXX

To initialize terraform code run ***terraform init***  <-> This will download all the dependencies and plugins where the codes resides
Now Run ***terraform plan***  <-> This will let you to preview the actions terraform would take to modify your infratructure
Now Run ***terraform apply*** <-> This will create the whole infrastructure over the cloud

<To destroy provisioned resources> run ***terraform destroy***




The provided configuration will help to create scalable and fault tolerant infrastructure.
