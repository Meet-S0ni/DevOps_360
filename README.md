# Tasks

1. Prepare a Lightweight Dockerfile for node app [Dockerfile](https://github.com/Meet-S0ni/WebClues-Task/blob/main/docker-app/Dockerfile)
2. Prepare Kubernetes deployment with qos and health probs [deployment.yaml](https://github.com/Meet-S0ni/WebClues-Task/blob/main/kubernetes/deployment.yaml)
2. Prepare Terraform for AWS EC2 [Terraform](https://github.com/Meet-S0ni/WebClues-Task/tree/main/Terraform)
3. Prepare Web server configuration on ec2 [web server config](https://github.com/Meet-S0ni/WebClues-Task/blob/f16192de6e661a5266ca2ad58a31e2941fd9b4d9/Terraform/main.tf#L134)
4. Prepare Ansible script to automate deployment of docker container [Ansible](https://github.com/Meet-S0ni/WebClues-Task/tree/main/Ansible)

####  Steps

1. [Install Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)
2. [Install aws cli](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)
3. [Install Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)
4. [Get aws security credentials `Access key` and `Secret access key`](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_access-keys.html#Using_CreateAccessKey)

5. [Configure aws cli in local](https://docs.aws.amazon.com/cli/v1/userguide/cli-chap-configure.html) 

   use this command 
    ```
    aws configure
    ```

### Clone repo using

```
git clone https://github.com/Meet-S0ni/WebClues-Task.git
```

## Execute Terraform script

1. move to terraform  directory
    ```
    cd terraform  
    ```
2. Initialize terraform code 
    ```
    terraform init
    ```

3. Format, validate and prepare plan  
    ```
    terraform fmt
    terraform validate 
    terraform plan
    ```

4. Apply code
    ```
    terraform apply 
    ```

## Kubernetes manifest with QOS  

Apply deployment yaml file 

```
kubectl apply -f kubernetes/deployment.yaml 
```

## Ansible 

1. Copy public ip from terraform/public_ip.txt file and put in inventory.ini file at ansible_host=<EC2_PUBLIC_IP>

2. Copy the ssh key from terraform/key.pem to Ansible directory

3. Copy docker-app directory into Ansible directory 

4. Run this commands to execute ansible playbook

```
ansible all -m ping -i inventory.ini
ansible-playbook  -i inventory.ini playbook.yaml
```
