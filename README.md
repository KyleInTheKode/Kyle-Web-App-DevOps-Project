# Web-App-DevOps-Project

Welcome to the Web App DevOps Project repo! This application allows you to efficiently manage and track orders for a potential business. It provides an intuitive user interface for viewing existing orders and adding new ones.

## Table of Contents

- [Features](#features)
- [Getting Started](#getting-started)
- [Technology Stack](#technology-stack)
- [Contributors](#contributors)
- [Documentation](#documentation)
- [License](#license)

## Features

- **Order List:** View a comprehensive list of orders including details like date UUID, user ID, card number, store code, product code, product quantity, order date, and shipping date.
  
![Screenshot 2023-08-31 at 15 48 48](https://github.com/maya-a-iuga/Web-App-DevOps-Project/assets/104773240/3a3bae88-9224-4755-bf62-567beb7bf692)

- **Pagination:** Easily navigate through multiple pages of orders using the built-in pagination feature.
  
![Screenshot 2023-08-31 at 15 49 08](https://github.com/maya-a-iuga/Web-App-DevOps-Project/assets/104773240/d92a045d-b568-4695-b2b9-986874b4ed5a)

- **Add New Order:** Fill out a user-friendly form to add new orders to the system with necessary information.
  
![Screenshot 2023-08-31 at 15 49 26](https://github.com/maya-a-iuga/Web-App-DevOps-Project/assets/104773240/83236d79-6212-4fc3-afa3-3cee88354b1a)

- **Data Validation:** Ensure data accuracy and completeness with required fields, date restrictions, and card number validation.

## Getting Started

### Prerequisites

For the application to succesfully run, you need to install the following packages:

- flask (version 2.2.2)
- pyodbc (version 4.0.39)
- SQLAlchemy (version 2.0.21)
- werkzeug (version 2.2.3)

### Usage

To run the application, you simply need to run the `app.py` script in this repository. Once the application starts you should be able to access it locally at `http://127.0.0.1:5000`. Here you will be meet with the following two pages:

1. **Order List Page:** Navigate to the "Order List" page to view all existing orders. Use the pagination controls to navigate between pages.

2. **Add New Order Page:** Click on the "Add New Order" tab to access the order form. Complete all required fields and ensure that your entries meet the specified criteria.

## Technology Stack

- **Backend:** Flask is used to build the backend of the application, handling routing, data processing, and interactions with the database.

- **Frontend:** The user interface is designed using HTML, CSS, and JavaScript to ensure a smooth and intuitive user experience.

- **Database:** The application employs an Azure SQL Database as its database system to store order-related data.

## Contributors 

- [Maya Iuga]([https://github.com/yourusername](https://github.com/maya-a-iuga))

## Documentation

### Terraform
#### Networking Module
There are three files in the networking-module
1. **Variables**
Which contains all the variables which can be set on launch.

- Group Name - The name of the Azure Resource Group where the networking resources will be deployed in.
- Location - The Azure region the resources will be deployed to
- Vnet Address Space - The address space for the Virtual Network (VNet).

2. **Outputs**

- Vnet ID - Stores the ID of the Vnet. Used within the cluster module to connect the cluster to the defined VNet.
- Control Plane Subnet ID - Stores the ID of the control plane subnet. Used to specify the subnet where the control plane componenet of the AKS cluster will be deplyed to.
- Worker Node Subnet ID - Stores the ID of the worker node subnet. Used to specify the subnet where the worker nodes of the AKS cluster will be deployed to.
- Networking Resource Group Name - Name of the resource group. Used to ensure the cluster module resources are provisioned within the same resource group.
- Network Securty Group - Name of the security group. Used to associate the NSG with the AKS cluster for security rule enforcement and traffic filtering.

3. **Main**

- Resource Group Name - The Azure Resource Group which uses the Group name variable
- Virtual Network - 
- Control Plane Subnet - 
- Worker Node Subnet - 
- Network Security Group - To allow traffic to the kube-apiserver and to allow SSH traffic.

**Initialise**
After the files have been written out, the command "terrafrom init" can be ran in the "networking-module" folder to get all the necessary files.

#### AKS Cluster Module
1. **Variables**
- AKS Cluster name - Represents the name of the AKS cluster you wish to create
- Cluster Location - Specifies the Azure region where the AKS cluster will be deployed to
- DNS Prefix - Defines the DNS prefix of cluster
- Kubernetes Version - Specifies which Kubernetes version the cluster will use
- Service Principal Client ID - Provides the Client ID for the service principal associated with the cluster
- Service Principal Secret - Supplies the Client Secret for the service principal

- Resource Group Name - The Azure Resource Group which uses the Group name variable
- Vnet ID - ID of the Virtual Network
- Control Plane_Subnet ID - ID of the control plane subnet
- Worker Node Subnet ID - ID of the worker node subnet

2. **Outputs**
- Aks Cluster Name  -Name of the AKS cluster
- Aks Cluster ID - ID of the AKS cluster
- Aks Kubeconfig - Kubeconfig file for accessing the AKS cluster

3. **Main**
The main just has one part: azurerm_kubernetes_cluster which contains the default node pool and the server principle

#### AKS Terraform
1. **Variables**
- Client ID - Access key for the provider
- Client Secret - Secret key for the provider
- IP Address - To allow traffic from a specific IP address

2. **Main**
- Provider - Contains the required details to access Azure
- AKS Module - Contains the contents of the Kubernetes module
- Networking Module - Contains the contents of the networking module

### Kubernetes
**Deployment Manifest**
- Defined a Deployment resource named flask-app-deployment with two replicas to ensure scalability and high availability.
- Labeled the pod template with app: flask-app to establish a clear connection between the pods and the application being managed.
- The Deployment points to the specific container image hosted on Docker Hub (truebluecloud/docker_application:version0.1) and exposes port 5000 for communication within the AKS cluster.
- Implemented the RollingUpdate deployment strategy, with a maximum surge of 1 and a maximum unavailable of 1 during updates.

**Service Manifest**
- Defined a Service resource named flask-app-service to route internal communication within the AKS cluster.
- The service selector matches the labels (app: flask-app) of the pods defined in the Deployment manifest.
- The service is configured to use TCP protocol on port 80 for internal communication, with the targetPort set to 5000.

**Deployment Strategy**
- The RollingUpdate deployment strategy was chosen as it ensures a smooth transition during updates. This works by making sure that at most there will only ever be one pod unavaliable at a time.

**Testing and Validation**
- Verfied the status and details of the pods and services, ensuring the pods are running.
- Used port forwarding to create a secure channel to interact with it locally on my PC.
- Accessed the page with the address: _http://127.0.0.1:5000_
- Went through pages and used the _Add Order_ button multiple times.

### Azure CI/CD Pipeline
- The source code repository is hosted on https://github.com/KyleInTheKode/Kyle-Web-App-DevOps-Project.
- The build pipeine uses Azure DevOps Pipeline to build and push to the docker repository: truebluecloud/docker_application_pipeline when an update to the main branch is updated.
- Once it is built, the release pipeline deploys the application to the Azure Kuberenetes Service cluster.
- To ensure that the piepline was correctly configured, I made sure the pipeline logs had no errors, checked the Docker hub to ensure an update was pushed, then accessed the application at the local host.

### Monitoring
**Metrics**
- Average Node CPU Usage - Helps ensure efficient resource allocation and detect potential performance issues
- Average Pod Count - Helps to evaluate the cluster's capacity and workload distribution
- Used Disk Percentage - Helps to measure how much disk is being used to help prevent low storage issues
- Bytes Read and Written per Second - Helps to monitor the I/O, potentially identifying perfomance bottlenecks.

**Logs**
- Average Node CPU Usage Percentage per Minute - This configuration captures data on node-level usage at a granular level, with logs recorded per minute
- Average Node Memory Usage Percentage per Minute - Similar to CPU usage, this log captures node-level memory usage per minute
- Pods Counts with Phase - This log configuration provides information on the count of pods with different phases, such as Pending, Running, or Terminating
- Find Warning Value in Container Logs - This log configuration searches for warning values in container logs, helping proactively detect issues or errors
- Monitoring Kubernetes Events - This log configuration monitors Kubernetes events, providing insights into pod scheduling, scaling activities, and errors

**Alerts**
- Used Disk Percentage - If used disk space goes above 80% an email alert will be sent off. This is checked every 5 minutes, looking at the last 15 minutes
- CPU Usage Percentage - If CPU usage goes above 80% an email alert will be sent off. This is checked every 5 minutes, looking at the last 15 minutes
- Memory Working Set Percentage - If memory working set goes above 80% an email alert will be sent off. This is checked every 5 minutes, looking at the last 15 minutes

### Key Vault

**Stored Secrets**
- server-name
- server-username
- server-password
- database-name

![Map](https://github.com/KyleInTheKode/Kyle-Web-App-DevOps-Project/blob/main/Map.png)

**Modifications**
To incorporate the key vault into the application, the stored secrets were changed to a link to the keyvault, adding the dependencies to both the app script as well as the requirements folder for docker to build from.

## License

This project is licensed under the MIT License. For more details, refer to the [LICENSE](LICENSE) file.
