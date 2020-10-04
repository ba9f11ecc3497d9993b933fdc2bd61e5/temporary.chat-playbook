
# aws deploy
### description : I do not plan on maintaining this playbook for general usage, but assuming you know your way around AWS, I made as easy as possible to use it. My goal is not to focus on the aws deployment but rather, keep my time for the chat server and it's features... that being said, feel free to use it.
#### requirements : 
- having ansible installed
- having an aws account
- having awscli installed locally on your machine for the user that will run the playbook
- having pre-existing resources in aws
  - an iam user with an ssh public key and appropriate permission to deploy ec2 instances
  - a security group with port 22,80,443 to you, your friends or the whole world   

#### note : this playbook will automatically add the new deployed host to the inventory file staging/hosts so you can run the playbook temporary.chat.yaml without editing your inventory
#### usage example:
`ansible-playbook --extra-vars "aws_region=us-east-1" --extra-vars "aws_vpc=vpc-23abcf46" --extra-vars "aws_subnet=subnet-1b6b1a6a" --extra-vars "aws_ami=ami-0dba2cb6798deb6d8" --extra-vars "aws_instance_type=t2.nano" --extra-vars "aws_sg=sg-008a34845ce896322" --extra-vars "aws_ssh_key=name_of_your_key_in_aws" --extra-vars "aws_tag=temporary.chat" --extra-vars "local_ssh_key_path=/home/your_local_user/.ssh/id_rsa" aws_deploy.yaml`


# temporary.chat
### description : a playbook to deploy a chat server where you can generate random rooms
####
ansible-playbook -i staging temporary_chat.yaml


# aws destroy
ansible-playbook --extra-vars="aws_region=us-east-1" --extra-vars="aws_tag=temporary.chat" aws_destroy.yaml

# the services

# the goals

- decentralize communications
- offer a free service that will remain free
- offer a paying service with more options
- offer the possibility to anyone to roll out their own
- end to end encryption

# the roadmap (oh god!)
