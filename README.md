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

- resource_group_name - The Azure Resource Group which uses the Group name variable
- Virtual Network - 
- Control Plane Subnet - 
- Worker Node Subnet - 
- Network Security Group - To allow traffic to the kube-apiserver and to allow SSH traffic.

**Initialise**
After the files have been written out, the command "terrafrom init" can be ran in the "networking-module" folder to get all the necessary files.

## License

This project is licensed under the MIT License. For more details, refer to the [LICENSE](LICENSE) file.
