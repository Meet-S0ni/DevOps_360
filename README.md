# Tasks

1. Prepare Lightweight Node Dockerfile 
2. Prepare Terraform for AWS EC2
3. Prepare Ansible to automate docker container

##  Steps

1. [Install Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)
2. [Install aws cli](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)
3. [Install Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)
4. [Get aws security credentials `Access key` and `Secret access key`](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_access-keys.html#Using_CreateAccessKey)

5. [Configure aws cli in local](https://docs.aws.amazon.com/cli/v1/userguide/cli-chap-configure.html) 

   use this command 
    ```
    aws configure
    ```

## Execute Terraform script

1. Initialize terraform code 
    ```
    terraform init
    ```

2. Validate and Format code 
    ```
    terraform validate 
    terraform fmt
    ```

3. Prepare plan 
    ```
    terraform plan
    ```

4. Apply code
    ```
    terraform apply 
    ```