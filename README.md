# REA Systems Engineer practical task

## To run and provision

- Command to run locally
- Command to provision and set up infrastructure in AWS
	- Add instructions to set up AWS credentials
	- Also add instructions to install Docker and how to use Terraform if required

## Approach

Docker container to host the Ruby service
- Docker compose on ECS
- Terraform to provision the hardware

This approach's main advantage is its simplicity in building and reasoning
about the deployment structure, ease of deployment with one command, and
Docker's excellent idemotentency. The last of these factors also makes it easy
to set up anti-fragile services, since Docker containers make it easy to kill
and respawn failing services as required.

Pitfalls include needing to have Docker installed on a development machine.
