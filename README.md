
##aws deploy

ansible-playbook --extra-vars "aws_region=us-east-1" --extra-vars "aws_vpc=vpc-23ebcf46" --extra-vars "aws_subnet=subnet-1d6b1a6a" --extra-vars "aws_ami=ami-0dba2cb6798deb6d8" --extra-vars "aws_instance_type=t2.nano" --extra-vars "aws_sg=sg-008a34845ce896322" --extra-vars "aws_ssh_key=luciano" --extra-vars "aws_tag=temporary.chat" --extra-vars "local_ssh_key_path=/home/luciano/.ssh/id_rsa" aws_deploy.yaml


##temporary.chat
ansible-playbook -i staging temporary_chat.yaml


##aws destroy
ansible-playbook --extra-vars="aws_region=us-east-1" --extra-vars="aws_tag=temporary.chat" aws_destroy.yaml
