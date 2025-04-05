# Terraform-Project-for-Public
This repository serves as documentation for implementing Infrastructure as Code using Terraform. It is intended to guide cloud architects in effectively utilizing Terraform for cloud infrastructure management.

# Host a Dynamic Ecommerce Website on AWS with Terraform

## Course Overview
This project covers how to provision an AWS cloud infrastructure for a dynamic e-commerce web application using Terraform. We use Terraform (Infrastructure as Code) to automate resource creation, integrate with GitHub for version control, and leverage AWS services like VPC, RDS, ALB, and more. Each step below corresponds to a phase in the project, complete with explanations and screenshots.

## 1. Course Introduction
Before diving in, ensure you understand the project goals and required tools:

- **Terraform**: HashiCorp Terraform is an infrastructure-as-code tool that lets you define and provision infrastructure in a predictable manner using configuration files. We write Terraform configuration files (.tf files) to set up AWS resources for our e-commerce site.
  
 ![image](https://github.com/user-attachments/assets/980255e5-ee05-4665-8f13-83330a0e9d1d)

- **AWS Infrastructure**: Our site runs on AWS. Key resources include a Virtual Private Cloud (VPC), subnets, an internet gateway, NAT gateways, an RDS database, security groups, an Application Load Balancer (ALB), an Auto Scaling Group, and a Route 53 DNS record. Terraform manages these.

- **GitHub & Git**: We keep our Terraform code in a GitHub repository (for version control and collaboration). Git is the version control software used to track code changes and push code to GitHub.

- **AWS CLI**: The AWS Command Line Interface lets us authenticate and interact with AWS from our local machine. We use it to configure credentials and verify connectivity.

## 2. Install Terraform (Windows)
To use Terraform, first download and install the Terraform binary for Windows:

1. **Download Terraform**: Visit the official Terraform website and download the appropriate Windows ZIP archive (32-bit or 64-bit depending on your system).


![image](https://github.com/user-attachments/assets/4ec148a2-a910-4294-805b-cbe44ea1bbca)


![image](https://github.com/user-attachments/assets/01fef2f3-fb42-4f75-a954-29290bafb901)


2. **Extract the ZIP**: Extract the downloaded terraform.zip to a folder (e.g., C:\Users\<YourName>\Desktop\terraform). You should see the terraform.exe binary in this folder.                                                                           
      ![image](https://github.com/user-attachments/assets/708f30e6-072b-4ff5-a796-59aa03187574)


3. **Add to PATH**: Add the folder path to your Windows Environment Variables so that Terraform can be invoked from any directory:
   - Open System Properties, go to the Advanced tab, and click Environment Variables![image](https://github.com/user-attachments/assets/9ca9718e-f700-49fe-974b-f4b8a27adf3d)

   - Under "System variables," select Path and click Edit                                                                                                                                                                                                  
                                                                                                                                                                                                                                                             ![image](https://github.com/user-attachments/assets/79b00a9c-56ea-46a0-81aa-ae7d48974a02)




![image](https://github.com/user-attachments/assets/d0fc3bb4-8255-43f4-a0a0-1269754ce24e)

   - Add a new entry with your Terraform folder path and click OK                                                                                                                                                                                          
             ![image](https://github.com/user-attachments/assets/6ec5211f-6fb1-4116-8adb-3d8d3e6de8c9)


4. **Verify installation**: Open a new Command Prompt and run `terraform -v` to verify that Terraform is installed and accessible. You should see the Terraform version output.                                                                            

![image](https://github.com/user-attachments/assets/2a02b3e2-3b01-4264-af0e-f50eac35b880)


## 3. Sign Up for a Free GitHub Account
If you don't have a GitHub account, create one to host your code:
- Create a GitHub Account at github.com
- Confirm your email address via the confirmation link
- Set up your profile (optional)

## 4. Create a GitHub Repository
Next, create a new repository on GitHub to store your Terraform configuration:

1. **New Repository**: Click the + (plus) icon and select "New repository." Provide a repository name (e.g., Terraform-Project) and description. Choose Private and initialize with a README and .gitignore (for Terraform).

2. **Repository Setup**: After creation, GitHub will display your new repo's main page with the README and .gitignore from the initial commit.

![image](https://github.com/user-attachments/assets/8da14a63-91c4-4f1b-9af3-c7abdd8aad00)

![image](https://github.com/user-attachments/assets/27d66e85-6bbb-4c12-81c8-e6eb778a6e8d)


## 5. Install Git (Windows)
Git is required to clone the repository and push code changes:

- **Download Git**: Visit the Git for Windows website and download the latest installer
- **Run Installer**: Launch the installer and follow the prompts
- **Complete Installation**: Verify Git is installed by running `git --version` in Command Prompt                                                                                                                                                          
   ![image](https://github.com/user-attachments/assets/00264bf7-6017-4c76-86c0-e0dd486a638c)


![image](https://github.com/user-attachments/assets/c37e2447-6b96-4060-9f10-f24995cd8e9a)


![image](https://github.com/user-attachments/assets/7ec4478a-4de7-4d2f-9bc6-8d2320162a8e)


![image](https://github.com/user-attachments/assets/39949481-5765-43e9-9dd7-a0ede7070d32)


## 6. Install Git (Mac Users Only)
If you are on a Mac, installing Git might not require a separate step since macOS often has Git (via Xcode Command Line Tools). If not, you can install Homebrew and run brew install git or download Git for Mac. Since our primary environment is Windows, this step is labeled “ONLY watch if you are using a Mac.” (No content needed for Windows users.)
In summary, Mac users ensure Git is installed (check with git --version). Windows users should focus on step 5.


## 7. Create Key Pairs (SSH Keys)
To securely interact with GitHub without typing your password each time:

- **Generate SSH Key**: Open Git Bash and run:
  ```
  ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
  ```
  Accept default location or specify custom path, and choose a passphrase if desired                                                                                                                                                                       
   ![image](https://github.com/user-attachments/assets/d9db3ac4-c3a7-45aa-ac92-b612a74a7e1a)

![image](https://github.com/user-attachments/assets/f43a3db3-088c-4c8b-b0b8-7f1b0e784648)

- **Locate Keys**: After generation, you'll have two files in ~/.ssh/ directory:
  - id_rsa (private key)
  - id_rsa.pub (public key)


![image](https://github.com/user-attachments/assets/9d531f2f-da3e-4622-ab0e-1ef302b6da31)


![image](https://github.com/user-attachments/assets/e62b03e5-f024-4c70-9afc-f6e12acddd34)

## 8. Add the Public SSH Key to GitHub
Configure GitHub to trust your computer's SSH key:

1. **Copy Public Key**: Open id_rsa.pub with a text editor and copy the entire contents                                                                                                                                                                    

![image](https://github.com/user-attachments/assets/90862f11-fd74-4811-9358-db5588c4854f)

2. **GitHub Settings**: Go to GitHub, click your profile picture and choose "Settings," then "SSH and GPG keys"                                                                                                                                            


![image](https://github.com/user-attachments/assets/f85494fb-3d40-4e09-a294-3c87dda0471e)


![image](https://github.com/user-attachments/assets/f3f59d47-ba6b-493d-889f-f2bab80a8b02)

3. **New SSH Key**: Click "New SSH key," give it a title like "my-public-Key" and paste the public key                                                                                                                                                     
       ![image](https://github.com/user-attachments/assets/1a167608-ec57-48f9-bbde-ad4d4970f36d)

4. **Save Key**: Click "Add SSH key" to complete the process                                                                                                                                                                                               


![image](https://github.com/user-attachments/assets/cefd3190-3713-4cda-b216-a384cd431fc1)


## 9. Clone Your Private Repository
With Git installed and SSH set up, clone the GitHub repository to your local machine:

1. **Get Clone URL**: Navigate to your GitHub repository page, click the green "Code" button, and select SSH to get the SSH clone URL                                                                                                                      

![image](https://github.com/user-attachments/assets/911917ba-3414-4aa3-bb96-c80103dc7d49)

2. **Clone via Command Line**: Open Command Prompt in your desired directory and run:
   ```
   git clone git@github.com:<YourUsername>/Terraform-Project.git
   ```![image](https://github.com/user-attachments/assets/784f90b1-c5a8-4d47-b497-13c3dedd586a)

3. **Clone Confirmation**: Navigate into the new folder (`cd Terraform-Project`) and list files to verify the repository contents                                                                                                                          


![image](https://github.com/user-attachments/assets/8b075e82-0e13-42a8-a4e5-876db9208ecf)
 
 
 

![image](https://github.com/user-attachments/assets/25080811-ba1e-46ab-9368-2e977f51b2c3)

 
 

![image](https://github.com/user-attachments/assets/2265a376-8ea6-4fcb-bf77-a73c1a640eb6)

## 10. Push Changes from Local to Remote
Test pushing code to GitHub:

- **Edit README**: Open README.md and add some text


![image](https://github.com/user-attachments/assets/8803e050-7e5a-4c15-9dd0-da8233a6c8f0)



![image](https://github.com/user-attachments/assets/18353f0f-80b2-498b-a355-826bd221d45e)

- **Git Add & Commit**: In Command Prompt, navigate to the repository directory and run:
  ```
  git add -A
  git commit -m "first commit"
  ```
- **Git Push**: Push the commit to GitHub:
  ```
  git push
  ```![image](https://github.com/user-attachments/assets/aac2f4ce-861d-410f-8706-537e8fb5aa7c)

- **Verify on GitHub**: Refresh your repository page to see the updated content

  
![image](https://github.com/user-attachments/assets/44d20465-8678-473c-9594-3fa6864a8fba)

## 11. Install Visual Studio Code (VS Code)
Use VS Code to write and manage Terraform code:

- **Download VS Code**: Get the appropriate installer from the Visual Studio Code website


![image](https://github.com/user-attachments/assets/35fd9377-b9d6-4bf5-bc45-69ec473752e6)

- **Install VS Code**: Run the installer and follow the steps
- **Initial Screen**: Launch VS Code and open your Terraform-Project folder



![image](https://github.com/user-attachments/assets/52f632e2-e7e6-4f39-a2ac-a90cfdc6776a)


## 12. Install Extensions for Terraform
Improve your Terraform development experience with VS Code extensions:

- **HashiCorp Terraform Extension**: Install the official HashiCorp Terraform extension



![image](https://github.com/user-attachments/assets/b8579927-14f9-402a-87bc-d38b0c64edd3)

- **Terraform by Anton Kulikov** (optional): Provides additional Terraform configuration language support



![image](https://github.com/user-attachments/assets/cb45f836-93ee-4dec-9f13-825920bd6586)

- **AWS Toolkit** (optional): For AWS integration

## 13. Install the AWS CLI (Windows)
Terraform needs AWS credentials to provision resources:

- **Download AWS CLI**: Get the Windows 64-bit installer from AWS documentation


![image](https://github.com/user-attachments/assets/f18a4794-996f-4371-a265-7aee16a7c90f)


![image](https://github.com/user-attachments/assets/99e4382e-84ae-4bea-a452-689f18cd42eb)

- **Run Installer**: Launch the MSI and follow the installation wizard
- **Verify Installation**: Open Command Prompt and run `aws --version`


![image](https://github.com/user-attachments/assets/19646eb4-6c4f-406f-a0b4-b90e4f6db297)


## 14. Creating an IAM User in AWS
Create a separate IAM user for Terraform rather than using your root AWS account:

1. **Open IAM Console**: Log in to AWS Management Console and search for "IAM"                                                                                                                                                                             


![image](https://github.com/user-attachments/assets/1f95c901-0a56-4753-9467-6709e1c59e76)

2. **Add User**: Click Users in the sidebar, then Add users
3. **User Details**: Provide a username (e.g., terraform-user) and ensure only programmatic access is selected                                                                                                                                             
 
 
 ![image](https://github.com/user-attachments/assets/17f252f2-49d3-4ab4-9789-00da45e7ac2e)

4. **Permissions**: Attach AdministratorAccess policy (for learning purposes; use least privilege in production)                                                                                                                                           
 
 
 ![image](https://github.com/user-attachments/assets/ee548f08-3da9-4a77-8648-5a87ad0e9f43)


![image](https://github.com/user-attachments/assets/fd50b540-fea6-41f2-bd32-88db8b606a84)

5. **Skip Tags**: Proceed to Review and Create user
6. **User Created**: Verify the new user appears in the list


![image](https://github.com/user-attachments/assets/1fc933ef-ee4c-41d2-8a1a-fb642d2d4dc5)

## 15. Generating an Access Key for the IAM User
Generate credentials for the IAM user:

1. **Open User Security Settings**: Click on your new user and navigate to the Security credentials tab

![image](https://github.com/user-attachments/assets/f3f647dd-662d-40e6-8bde-18fc20246e0b)

2. **Create Access Key**: Click Create access key and select Command Line Interface (CLI) as the use case                         


![image](https://github.com/user-attachments/assets/bbbb8b9f-0155-4088-a2f7-3eb171b71d04)



![image](https://github.com/user-attachments/assets/1855352a-7a66-4a5f-901e-e723bb71e18a)

3. **Retrieve Keys**: Copy the Access Key ID and Secret Access Key or download the CSV file


![image](https://github.com/user-attachments/assets/1c666d9f-f149-48a2-aaf2-83161636f4fc)



![image](https://github.com/user-attachments/assets/e1739cfc-6f8e-4f84-bf74-8e986731cbb1)

4. **Store the Keys Securely**: Save these credentials in a safe place

## 16. Create a Named Profile (AWS CLI Configure)
Configure a profile for Terraform with the new access keys:

- **AWS Configure**: Run the following command:
  ```
  aws configure --profile terraform-user
  ```
  Enter your Access Key ID, Secret Access Key, default region (e.g., us-east-1), and output format

- **Confirmation**: Verify by running:
  ```
  aws configure list --profile terraform-user
  ```
  
![image](https://github.com/user-attachments/assets/013f09f4-05fc-4424-a8af-e4c74f141b52)


![image](https://github.com/user-attachments/assets/7fcb3508-836f-4433-9c8a-f8e1e9216c46)


![image](https://github.com/user-attachments/assets/43a7b140-a5ef-47c8-bd1a-fc1a096c684f)

## 17. Create an S3 Bucket for Terraform State
Create an S3 bucket to store Terraform state files:

- **Choose a Bucket Name**: Form a globally unique bucket name
- **Create Bucket**: In AWS Console, go to the S3 service and create a new bucket in your desired region


![image](https://github.com/user-attachments/assets/884fd05f-5a2a-49fe-8d20-bd65d479579e)


![image](https://github.com/user-attachments/assets/a23fa56b-4502-4766-bfb0-767cb1f6ec51)

- **Enable Versioning**: For state file safety, enable versioning on the bucket


![image](https://github.com/user-attachments/assets/d0888e12-5c25-473b-8302-ef0058543565)

## 18. Writing Terraform Configurations for AWS Resources
Create Terraform files for each AWS resource:

- **provider.tf / main.tf**: Configure AWS provider and backend
- **vpc.tf**: Define VPC, subnets, internet gateway, and route tables
- **nat-gateway.tf**: Set up NAT Gateways for private subnet internet access
- **security-group.tf**: Create security groups for resources
- **rds.tf**: Configure RDS database instance
- **alb.tf**: Define Application Load Balancer
- **autoscaling.tf**: Set up Auto Scaling Group
- **sns.tf**: Create SNS notification topic
- **route53.tf**: Configure DNS records
- **outputs.tf**: Define output values
- **variables.tf**: Define input variables
- 
![image](https://github.com/user-attachments/assets/d5dc0435-96dd-4d0d-aaf3-dcb71a97918f)

![image](https://github.com/user-attachments/assets/f3810127-6de6-450f-b8e5-6a10759db823)

![image](https://github.com/user-attachments/assets/b4e8392c-fdc4-4b24-8ed4-08d7949f9f43)

![image](https://github.com/user-attachments/assets/5c59ea85-5320-442d-a6a9-02e793a48769)


## 19. Authenticate Terraform with AWS
Configure Terraform to use AWS credentials:

![image](https://github.com/user-attachments/assets/1561de90-f870-4aa1-8a5f-47de8ec7b7e7)

![image](https://github.com/user-attachments/assets/da4d19e9-cc8f-4762-b58a-5a9ca9cb09dc)

![image](https://github.com/user-attachments/assets/f68371e5-3983-4c34-a8e4-8a4d341488f0)

1. **Backend Configuration**: Create main.tf with AWS provider and S3 backend configuration


![image](https://github.com/user-attachments/assets/9c69054c-0912-49bf-af85-1a610b8da874)

![image](https://github.com/user-attachments/assets/022761f1-37d0-453c-9565-2814f4cebef0)

![image](https://github.com/user-attachments/assets/6507099b-646e-490c-8ccf-9518f028b2fb)

![image](https://github.com/user-attachments/assets/d3147af8-cf70-4a0a-9451-b2ad926b16ef)


![image](https://github.com/user-attachments/assets/f4733eb4-4c9e-4d49-94cb-359df2d058b4)


![image](https://github.com/user-attachments/assets/f09076fc-6154-4198-ac11-b2ce977a5565)


![image](https://github.com/user-attachments/assets/3b2f2db5-ac88-4597-92aa-eaeb6090e1f3)


![image](https://github.com/user-attachments/assets/fa12bcce-90de-46cb-8100-0dd9c41d0c19)


![image](https://github.com/user-attachments/assets/8935fe72-d14b-4df6-a4d5-3a55d369ef15)

2. **Initialize Terraform**: Run `terraform init` to download plugins and initialize backend                         

![image](https://github.com/user-attachments/assets/0ec84ed3-212e-4de8-8c2a-bee91b3d13f2)

3. **Commit Changes**: Commit and push your configuration files to GitHub
![image](https://github.com/user-attachments/assets/4fe47efc-001a-4c06-9628-7cbcb839883c)


![image](https://github.com/user-attachments/assets/ef1d5c75-e399-4b40-9455-104d879c8c71)


![image](https://github.com/user-attachments/assets/3d9d59d0-f47f-4bce-a045-7c567444f45a)


![image](https://github.com/user-attachments/assets/c1fd74a9-92ee-4b70-9d26-3c03b7c69140)


![image](https://github.com/user-attachments/assets/4634afe6-2569-43e4-985b-f7e9aea338c6)

## 20. Create VPC
Establish the networking foundation:

1. **Create variables.tf**: Define network-related variables

 ![image](https://github.com/user-attachments/assets/3aa48a4f-f715-4000-ae2f-632abcb6d42c)

2. **Create vpc.tf**: Define VPC, subnets, internet gateway, and route table resources


![image](https://github.com/user-attachments/assets/345ff075-7fb9-410a-b8de-afb8c3af5c41)

![image](https://github.com/user-attachments/assets/06c11958-5bb1-44cf-9cdb-b098779b8bdd)

![image](https://github.com/user-attachments/assets/e16f52e8-5957-451b-be11-348fd898f3c1)


![image](https://github.com/user-attachments/assets/68303813-7357-4446-bc1e-df2150304423)

3. **Apply Changes**: Run `terraform apply` to create these resources

![image](https://github.com/user-attachments/assets/735677fa-ee26-4772-859a-a6efd5827b0c)

![image](https://github.com/user-attachments/assets/70cb6b5c-e99c-4505-a05c-018a0eebb677)


![image](https://github.com/user-attachments/assets/641a0a53-0358-45df-affb-17b770673d07)

4. **Verify Creation**: Check AWS console to confirm resources were created                            

![image](https://github.com/user-attachments/assets/ec01f11d-b728-486e-97c5-d5dc227a2362)

![image](https://github.com/user-attachments/assets/031d6e1c-76e6-4513-81a2-1b7440d405d3)

![image](https://github.com/user-attachments/assets/069a4d73-5bda-424b-99fa-d6d38bca862b)


![image](https://github.com/user-attachments/assets/128ef333-a1ca-46a9-b4f1-366a606444e5)


![image](https://github.com/user-attachments/assets/49e32b28-55d4-4df7-9d03-0243ba74c745)


![image](https://github.com/user-attachments/assets/f0de1f95-4817-4c8c-901d-609abc5289c9)

5. **Commit Changes**: Push your code to GitHub

![image](https://github.com/user-attachments/assets/dc6e77d0-4acd-42ae-9e7c-d68439372c05)


![image](https://github.com/user-attachments/assets/14a011c0-6209-4c5a-89d8-9c168325aa1b)

## 21. Create NAT Gateway
Set up outbound internet access for private subnets:

1. **Create nat-gateway.tf**: Define Elastic IPs, NAT Gateways, and private subnet route tables


![image](https://github.com/user-attachments/assets/7ea59c4c-4c80-456b-b560-1bb478404ce5)

![image](https://github.com/user-attachments/assets/e141c4e8-f465-4978-8d2c-b762eb0fed3a)


![image](https://github.com/user-attachments/assets/678c5505-dc61-430b-9a61-be758ae68bda)

2. **Apply Changes**: Run `terraform apply` to create these resources

![image](https://github.com/user-attachments/assets/a45280ce-c777-4802-bfb3-2efcd69c1b0e)
 
 

![image](https://github.com/user-attachments/assets/6a1a7146-1949-4d49-aa5c-ea4dd90e4b22)

3. **Verify Creation**: Check AWS console to confirm resources were created


![image](https://github.com/user-attachments/assets/129b24ae-e31b-4e2e-b529-79fca8b74aa1)


![image](https://github.com/user-attachments/assets/f1b45277-da1e-4d23-966d-09e0516a2f10)


![image](https://github.com/user-attachments/assets/170ed0c7-3cd4-4e26-9cc5-9fea5b7d12ab)


![image](https://github.com/user-attachments/assets/62608e32-3af5-4bd2-a2b2-85ba7bb54e1a)

4. **Commit Changes**: Push your code to GitHub


![image](https://github.com/user-attachments/assets/0626f24e-04df-4f6c-b116-9ccba2cea3da)


![image](https://github.com/user-attachments/assets/6be1ef94-f240-4932-b0f9-4dbe6cedaf3e)


![image](https://github.com/user-attachments/assets/b32e14f5-db73-4c05-892d-189d0512fbcd)


![image](https://github.com/user-attachments/assets/2404fad1-2e5a-459e-aa67-d6488f10a67e)

## 22. Create Security Group

Define network security rules:

1. **Create security-group.tf**: Define security groups for ALB, SSH access, web servers, and database


![image](https://github.com/user-attachments/assets/e72e9bdb-339e-4d10-bae5-2c6b040b4a13)


![image](https://github.com/user-attachments/assets/d92cc911-a71b-4f13-8c89-aade4c3fddfd)


![image](https://github.com/user-attachments/assets/0865a877-f335-4559-be3f-e56eb56f95d4)


![image](https://github.com/user-attachments/assets/465c5fee-d6e6-429e-9bdc-3f6719127338)

2. **Apply Changes**: Run `terraform apply` to create these resources


![image](https://github.com/user-attachments/assets/d9355fc2-3cdc-4b0b-8fb6-04ac8cab0b9d)

3. **Verify Creation**: Check AWS console to confirm resources were created


![image](https://github.com/user-attachments/assets/56e3d461-4f79-407f-9db5-8ac952880a2b)


![image](https://github.com/user-attachments/assets/8fbd8173-5ec4-4959-b2a7-9990d61ff3e0)


![image](https://github.com/user-attachments/assets/68ae8803-510f-4482-b9df-d437adc2884f)

4. **Commit Changes**: Push your code to GitHub


![image](https://github.com/user-attachments/assets/e3b24855-b094-4d50-be29-0dfecdd34fbb)


![image](https://github.com/user-attachments/assets/b60b6752-5653-485b-8934-a99d6b3a649f)


![image](https://github.com/user-attachments/assets/ddece506-bdb1-41be-a9c9-dfbec85189fc)


## 23. Create RDS (Database)  


Provision a database from an existing snapshot:

1. **Identify Snapshot**: Locate your "shopwise" snapshot in the AWS Console


![image](https://github.com/user-attachments/assets/6713fb09-9a87-4918-b75c-74ed7eab536e)


![image](https://github.com/user-attachments/assets/0f2f218f-501d-4ed8-8adf-445d77c34b82)


![image](https://github.com/user-attachments/assets/a343ff77-1a64-46a0-8c70-5747d43f2f80)


![image](https://github.com/user-attachments/assets/ec471800-a135-4266-b75a-8469376209db)

2. **Add Database Variables**: Update variables.tf with database parameters                  ![image](https://github.com/user-attachments/assets/0909020d-6315-46b7-a50b-735856e06623)

3. **Create rds.tf**: Define database subnet group and RDS instance restored from snapshot


![image](https://github.com/user-attachments/assets/a78254ba-ee8c-47c9-a72b-968556f8f511)


![image](https://github.com/user-attachments/assets/4d197c13-e9f3-4f3d-abf5-3bcb25376ad6)

4. **Apply Changes**: Run `terraform apply` to create these resources

![image](https://github.com/user-attachments/assets/9e115d8b-55ee-4d9a-b393-4f215200d491)

If you encounter an error due to instance class type update and reapply             

![image](https://github.com/user-attachments/assets/3c77d12a-3a9d-4149-b212-e682f7ed22cc)



![image](https://github.com/user-attachments/assets/e537d698-617e-4fbc-a8fd-38db4b2d9d0b)

5. **Verify Creation**: Check AWS console to confirm the database is available


![image](https://github.com/user-attachments/assets/0aa59c46-8b17-4620-8d20-b838930e0dab)

6. **Commit Changes**: Push your code to GitHub


![image](https://github.com/user-attachments/assets/aab74cd9-b518-4b46-b62a-940516136f84)


![image](https://github.com/user-attachments/assets/4bcbb49a-cb58-4c0e-81e6-59cc246381d3)


![image](https://github.com/user-attachments/assets/7922e012-bb19-4922-b871-e33506b015e8)

## 24. Create Application Load Balancer (ALB)
Set up load balancing for your web application:

1. **Create alb.tf**: Define ALB, target group, and listener resources


![image](https://github.com/user-attachments/assets/c0466db0-7bbb-47f2-81ac-ae3859c36809)


![image](https://github.com/user-attachments/assets/0743a660-715e-485d-b81f-b563148d3b74)


![image](https://github.com/user-attachments/assets/6aa29058-e0a7-41cf-b803-93cc23b2ac07)


![image](https://github.com/user-attachments/assets/069ea7bd-04bf-4752-8654-9d288a0887fd)

2. **Apply Changes**: Run `terraform apply` to create these resources                                        ![image](https://github.com/user-attachments/assets/08fc4f3c-c7cf-4c61-8027-c40896908a52)

3. **Verify Creation**: Check AWS console to confirm ALB is provisioned


![image](https://github.com/user-attachments/assets/bee1c7e7-4d57-4da5-b67b-46f100e5de5d)



![image](https://github.com/user-attachments/assets/fd8651db-30a6-4b58-8aa7-c1065c17d53e)


![image](https://github.com/user-attachments/assets/4de12c2d-3aa2-4ced-9fc2-ff8609e0ac31)

4. **Commit Changes**: Push your code to GitHub


![image](https://github.com/user-attachments/assets/b6104b8e-32f5-4399-bb94-990fced8ac09)


![image](https://github.com/user-attachments/assets/56ac12f8-a0f2-4294-b31a-11d0defd7613)


![image](https://github.com/user-attachments/assets/c6ab1f3f-97d4-416f-a3a5-965f67fa92d6)

## 25. Create SNS Topic  

Configure notifications:

1. **Create sns.tf**: Define SNS topic and subscription resources                            ![image](https://github.com/user-attachments/assets/d075c4c3-0e39-4414-878f-5af8248224cb)

2. **Add Email Variable**: Update variables.tf with operator email                   ![image](https://github.com/user-attachments/assets/b7eaa266-20e0-417d-b181-0326e4691d05)

3. **Apply Changes**: Run `terraform apply` to create these resources                    ![image](https://github.com/user-attachments/assets/ee03fecd-3f72-46e4-8d03-1f879ee9da37)

4. **Verify Creation**: Check AWS console to confirm SNS topic is created                                ![image](https://github.com/user-attachments/assets/9771a63a-72f7-44f7-8ac6-a77fdc6cd5d6)


![image](https://github.com/user-attachments/assets/8d5b9e54-1f01-45f2-aa79-90dc9bcd0e8a)

5. **Commit Changes**: Push your code to GitHub


![image](https://github.com/user-attachments/assets/a7329d6d-7b42-435c-bc22-0a79dbf74d04)


![image](https://github.com/user-attachments/assets/fb075139-0e5f-419c-83df-be2d57e89522)

## 26. Create Auto Scaling Group (ASG)

Set up dynamic scaling for your web servers:

1. **Create asg.tf**: Define launch template, auto scaling group, and notifications

 
 ![image](https://github.com/user-attachments/assets/92521420-a71d-4232-ac87-91b7c9a6f1ad)


![image](https://github.com/user-attachments/assets/3d0b410f-8395-4a4d-b708-cfb266d1f17e)

2. **Apply Changes**: Run `terraform apply` to create these resources                            ![image](https://github.com/user-attachments/assets/4a3733ae-0ff9-4614-b56c-c73614a9bfe5)

3. **Verify Creation**: Check AWS console to confirm instances are running                   

![image](https://github.com/user-attachments/assets/43c4325b-5d7a-43e1-a07b-19a49c236fa4)


![image](https://github.com/user-attachments/assets/43b7fde3-8fa2-444f-8724-4d5c446798d3)

4. **Commit Changes**: Push your code to GitHub
![image](https://github.com/user-attachments/assets/1e3a923b-ea8a-4272-b362-d5581b44c526)

![image](https://github.com/user-attachments/assets/ba1a4427-53e0-41a3-b32d-eac476c1e3fe)

## 27. Create Record Set in Route 53

![image](https://github.com/user-attachments/assets/87a35012-2e91-4bb7-b3bb-ef0c8cb480ff)

Configure DNS for your application:

1. **Create route53.tf**: Define DNS record pointing to your ALB   

![image](https://github.com/user-attachments/assets/12f4a9e8-3108-4dd1-b220-a7e887f5810b)


![image](https://github.com/user-attachments/assets/ce974875-948d-4b25-b401-12a94c391e3e)

![image](https://github.com/user-attachments/assets/20f2d94e-7c24-4b52-b279-5252ed912cf3)

2. **Apply Changes**: Run `terraform apply` to create these resources

![image](https://github.com/user-attachments/assets/d94194c4-514b-4f46-af1f-318d9f21b4b1)


3. **Verify Creation**: Check AWS console and test your domain

![image](https://github.com/user-attachments/assets/9081117a-1ef5-4944-b17f-3cb31b1bb8f3)

![image](https://github.com/user-attachments/assets/a9e264de-a94c-4e07-9275-f98c19f41e85)


4. **Commit Changes**: Push your code to GitHub
![image](https://github.com/user-attachments/assets/ac8271a6-6aa4-44db-ab07-9dc816790c36)

![image](https://github.com/user-attachments/assets/2aa88a05-926d-4cd7-bfea-1234e4c9c120)

![image](https://github.com/user-attachments/assets/1e53ac2a-5818-4525-8b3b-c9c71eec5ea7)


## 28. Terraform Outputs
Configure useful output values:
![image](https://github.com/user-attachments/assets/72bcf372-c5de-451f-a204-1b4bc682c662)

1. **Create outputs.tf**: Define outputs for important resource information

![image](https://github.com/user-attachments/assets/a14be240-0dcb-458a-b5e9-d5556583a56c)


2. **Apply Changes**: Run `terraform apply` to display these outputs

![image](https://github.com/user-attachments/assets/e8bd67c7-57a4-4e67-9ef3-f9c6da04ae0f)


3. **Verify Outputs**: Ensure all expected information is displayed

![image](https://github.com/user-attachments/assets/d0da243b-9527-4d6c-a4fa-100535c25b18)


![image](https://github.com/user-attachments/assets/e8597b2f-b157-4489-9436-6415d1965ad0)

## 29. Clean Up
When finished, remove all created resources:

1. **Destroy Resources**: Run `terraform destroy -auto-approve`

![image](https://github.com/user-attachments/assets/c693c05f-a344-42e3-99f4-5ea61c773266)


![image](https://github.com/user-attachments/assets/a912bd69-24e2-4356-90fc-89504a1a8c45)

2. **Verify Cleanup**: Check AWS console to ensure all resources are removed

![image](https://github.com/user-attachments/assets/6930da8c-c7ef-4707-aa61-a7778a9b51b0)

3. **Remove Local Files**: Delete local credentials if no longer needed

## Conclusion
You have now hosted a scalable, dynamic e-commerce website's infrastructure on AWS using Terraform. From networking (VPC, subnets, NAT) to compute (EC2 Auto Scaling), load balancing (ALB), database (RDS), and domain setup (Route 53), all aspects were automated with Terraform configurations. This approach makes it easy to version, share, and reuse infrastructure code.
