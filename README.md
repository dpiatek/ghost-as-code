# ghost-as-code

Infrastructure-as-code configuration for [Ghost](https://ghost.org/) on AWS.

This is a playground to test concepts of infrastructure-as-code, in particular
low-costs projects that still need a dedicated server, but otherwise have minimal
requirements to run.

It uses Packer to create an AWS AMI, Terraform to manage infrastructure and Docker to run Ghost.
Backups are stored in S3.

## Deployment

Currently, following manual steps need to be done to deploy and the aim is to simplify them as much as possible:

1.  Source variables, setup AWS "private" profile and blog keypair
2.  Run backup script (if instance exists)
3.  Run packer to create/update AMI
4.  Run terraform to create/update infra (update AMI)
5.  Run upload backup script (update public dns - $INSTANCE)
6.  Run docker-compose on the instance

Features:

- add CI
- remove domain specific data (from git too)
- dry run for certs
- blue/green deploys
- non-local tf state
- pass AMI to terraform
- pass ec2 public dns to bash
- pass env vars to instance start scripts
- improve nginx config
