# REA Systems Engineer practical task

Solution to deploying the Simple Sinatra app

## Requirements to provisioning
The solution makes use of AWS, Docker, and Ansible.

The Ansible playbook requires there to be a default AWS user set up in
`~/.aws/credentials`. The required permissions for the user are as follows:
- IAMFullAccess
- AmazonEC2ContainerRegistryFullAccess
- AmazonECS_FullAccess
- AmazonVPCFullAccess

Docker must be installed and running, and Ansible installed via `pip3`.

## To run and provision

- Run `ansible-playbook deploy.yml` to build and push the Docker container and create
and provision the infrastructure in AWS.

## Design overview and rationale

The solution utilises Docker, which is pushed to an Elastic Container Registry (ECR). 
Elastic Container Service will then pull from ECR and run a task to deploy the Docker
container to a cluster which runs on an EC2 instance. The EC2 task definition type was chosen
since the Fargate type was unable to offer container port forwarding, which was required
to forward port 80 to port 9292 the web application utilises.

Docker was chosen since it abstracts away the details of configuring the OS, and its ease
of pushing the web server and OS as a self-contained package to a registry. Ansible was
used for its ease of use and relatively low learning curve. 

## Shortfalls and issues

Unfortunately, the script is not functional due to an issue the author ran into with 
provisioning the EC2 instance with the required machine image ECS requires. As a result,
the script fails to set up a working web server on ECS.

The `docker push` step of the deploy can take a lengthy amount of time, depending on the
Internet connection available and upload bandwidth available.

## Attributions

These are sources the author used to provide a base to work with in the creation of the
Ansible playbook.

Credit to configo [Source](https://github.com/comefigo/ansible-push2ecr/blob/master/push_image.yml)

Credit to Daniel Roades[Source](https://github.com/daniel-rhoades/greeter-service-example)