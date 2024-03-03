<!DOCTYPE html>
<html>

<body>

  <h1>🚀 Infrastructure as Code for AWS VPC Setup 🌐</h1>
  <p>This repository contains Terraform scripts for provisioning a basic infrastructure setup on Amazon Web Services (AWS). The infrastructure includes a Virtual Private Cloud (VPC) with public and private subnets, an Internet Gateway, NAT Gateway, EC2 instance, and a MySQL RDS instance. The setup is designed to be a starting point for deploying scalable and secure applications on AWS.</p>

  <h2>Features</h2>
  <ul>
    <li>🔧 VPC Configuration: Configures a VPC with CIDR block and enables DNS support and hostnames.</li>
    <li>🌍 Subnets: Creates public and private subnets in different availability zones within the VPC.</li>
    <li>🌐 Internet Gateway: Attaches an Internet Gateway to the VPC for internet access from public subnets.</li>
    <li>🌐 NAT Gateway: Provides outbound internet access for instances in private subnets.</li>
    <li>🔒 Security Groups: Sets up security groups for EC2 and RDS to control inbound and outbound traffic.</li>
    <li>🛣️ Route Tables: Defines route tables for public and private subnets with appropriate routes.</li>
    <li>💻 EC2 Instance: Launches an EC2 instance in the private subnet with SSH access.</li>
    <li>🐬 RDS Instance: Deploys a MySQL RDS instance in the private subnet with specified configurations.</li>
    <li>🔗 VPC Endpoint: Creates a VPC endpoint for EC2 instance connectivity.</li>
  </ul>

  <h2>Prerequisites</h2>
  <p>Before running the Terraform scripts, ensure you have:</p>
  <ul>
    <li>🔑 AWS account with appropriate permissions.</li>
    <li>🛠️ Terraform installed on your local machine.</li>
  </ul>

  <h2>Usage</h2>
  <ol>
    <li>Clone this repository to your local machine.</li>
    <li>Navigate to the directory containing the Terraform scripts.</li>
    <li>Initialize Terraform by running <code>terraform init</code>.</li>
    <li>Review and customize the <code>terraform.tfvars</code> file with your AWS credentials and desired configurations.</li>
    <li>Apply the Terraform configuration by running <code>terraform apply</code>.</li>
  </ol>

  <h2>Configuration</h2>
  <ul>
    <li><code>variables.tf</code>: Defines input variables used in the Terraform configuration.</li>
    <li><code>terraform.tfvars</code>: Specifies the values for input variables (AWS credentials, region, CIDR blocks, etc.).</li>
    <li><code>main.tf</code>: Contains the main Terraform configuration.</li>
    <li><code>outputs.tf</code>: Defines the outputs (e.g., resource IDs) to display after Terraform applies the configuration.</li>
    <li><code>backend.tf</code>: Contains the configuration for handing the tstate file.</li>
    <li><code>vpc_sub_rt.tf</code>: Contains the configuration VPC, Subnets, Route Tables.</li>
    <li><code>instances_ep.tf</code>: Contains the configuration Web Server & RDS.</li>
    <li><code>jenkins.tf</code>: Contains script for creating IAM user for jenkins.</li>
  </ul>

  <h2>Additionally</h2>
    <ul>
        <li>There is a tf script for creating IAM user for jenkins.</li>
        <li>The script also saves your access key and secret access key 🔑 your local system🖥️.</li>
    </ul>

 <p>Consider following. Each follow will be equal to one glass of water🥛 for an African child.</p>
</body>

</html>

