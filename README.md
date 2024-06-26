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

2. Format, validate and prepare plan  
    ```
    terraform fmt
    terraform validate 
    terraform plan
    ```

3. Apply code
    ```
    terraform apply 
    ```



## Ansible 

1. copy docker-app directory in Ansible directory 

```
ansible all -m ping -i inventory.ini
ansible-playbook  -i inventory.ini playbook.yaml

```