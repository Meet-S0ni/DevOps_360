# Tasks

1. Prepare Lightweight Node Dockerfile 
2. Prepare Kubernetes deployment with qos and health probs
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

1. move to terrafrm  directory
    ```
    cd terrafrm  
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

# Kubernetes manifest with QOS  

### Apply deployment yaml file 
```
kubectl apply -f kubernetes/deployment.yaml 
```
- To check health probs use this command 
```
kubectl exec -it <pod-name> -- bash -c "nginx -s stop"
```
- you will see that pod restarts due to health probs 

## Ansible 

1. Copy public ip from terrafrm /public_ip.txt file and put in inventory.ini file at ansible_host=<EC2_PUBLIC_IP>

2. Copy ssh key from terrafrm /public_key.pem to Ansible directory

3. Copy docker-app directory in Ansible directory 

4. Run this commands to execute ansible playbook

```
ansible all -m ping -i inventory.ini
ansible-playbook  -i inventory.ini playbook.yaml

```

5. Open URL: http://<Public-ip>:3000