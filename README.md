# Automated ELK Stack Deployment
##  UofU Cyber Security Bootcamp ELK Stack Project
The files in this repository were used to configure the network depicted below.
![cloudsecurity](https://github.com/sopigogo/Elk-Stack/blob/4ff4871190cd7af4be4dcecafc0cfa7402ed7131/Cloud%20Security.jpg)


These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above.



| File Name                              | Description                                                                                                                                                                                                                                                                                               |
|----------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| /etc/ansible/hosts                     | This file already exists in your ansible folder inside of your JumpBox’s container.  It is important to include the private IP addresses of your webservers in this file under [webservers], as well as the private IP address of the ELK server under [elk].  Remove the # in order to activate command. |
| /etc/ansible/ansible.cfg               | Located at the ansible folder within Docker container. Add private IP addresses of the webservers.                                                                                                                                                                                                        |
| daemon.json                            | By adding daemon.json within the container the IP address will change in order in order to match the subnet of virtual network.                                                                                                                                                                           |
| dvwa-playbook.yml                      | The dvwa-playbook.yml is used from the ansible container inside the JumpBox to launch a DVWA container in the vm's being used as webservers.                                                                                                                                                              |
| /ect/ansible/files/filebeat-config.yml | This is the configuration to FileBeat.                                                                                                                                                                                                                                                                    |
| filebeat-playbook.yml                  | This playbook install and launches Filebeat shipper in the vulnerable webserver. Filebeat will send logs to ELK for further analysis.                                                                                                                                                                     |                                                                                                                                         
| install-elk.yml                        | It is used from the ansible container in JumpBox to install and launch ELK in the ELKVM. Kibana will be accessible from private IP via TCP 5601.|                                                                                                                                                          |

This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build

### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application. By simply logging in to the JumpBox changes and modifications to the different containers and vm's can be deployed from this one single VM. 

Load balancing ensures that the application will be highly effective and efficient, in addition to restricting unauthorized access to the network. The Load Balancer functionality provides the ability to redirect excess traffic to the cloud so applications are able to remain available. Because of its policy, controls are able to stop bad traffic from ever reaching the application. In simple words, it contributes a great deal in preventing DDoS attacks. 


Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the network and system logs.

Filebeat monitors the log files, collects log events and     forwards them either to Elasticsearch or Logstash for indexing.

Metricbeat helps monitor servers by collecting metrics from the system and services running on the server.

The configuration details of each machine may be found below.
| Name          | Function         |  IP Address  | Operating System |
|---------------|------------------|:------------:|------------------|
| JumpBox       | Gateway          | 10.0.0.1     | Linux            |
| Web-1         | DVWA Server      | 10.0.0.5     | Linux            |
| Web-2         | DVWA Server      | 10.0.0.6     | Linux            |
| Web-3         | DVWA Server      | 10.0.0.7     | Linux            |
| ELKVM         | ELK Server       | 10.1.0.4     | Linux            |
### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the ELK server machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
Workstation Public IP through TCP 5601

Machines within the network can only be accessed by JumpBox and my workstation.
The machines allow to access ELK VM is JumpBox IP:10.0.0.1 and my workstation's public IP via port TCP 5601.

A summary of the access policies in place can be found in the table below.

| Name          | Publicly Accessible |          Allow IP Address          |
|---------------|---------------------|:----------------------------------:|
| JumpBox       | Yes                 | Workstation Public IP on SSH 22    |
| Web-1         | No                  | 10.0.0.5 on SSH 22                 |
| Web-2         | No                  | 10.0.0.6 on SSH 22                 |
| Web-3         | No                  | 10.0.0.7 on SSH 22                 |
| ELKVM         | No                  | Workstation Public IP  on TCP 5601 |
| Load Balancer | No                  | Workstation Public IP on HTTP 80   |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because Ansible allows you to create and deploy new tasks via playbooks minimizing time and human error.

The playbook implements the following tasks:

- Points to a group of machines along to the remote user:

-name: Configure elk VM with Docker
 hosts: elk
 remote_user: sysadmin
 tasks:

- Increase System Memory:

-name: Use more memory
systctl:
  name: vm.max_map_count
  value: 262144
  state: present
  reload: yes

- Installation of following services:
  
'docker.io'
'python3-pip'
"docker' docker python pip module.

- To launch and expose container with published ports:

'5601:5601'
'9200:9200'
'5044:5044'
The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

![elkplay](https://github.com/sopigogo/Elk-Stack/blob/main/ELKPLAY%20(3).jpg)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:  Web-1 : 10.0.0.5, Web-2 : 10.0.0.6 and Web-3 : 10.0.0.7 ; All of these 3 VM's have Filebeat and MetricBeat installed in order to send system logs and audit logs to Kibana allowing a much more efficient monitoring of the servers. For example; FileBeat collects Log Events which  allows us to track recent changes while MetricBeat collects machine metrics such as uptime/

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the YAML file to /etc/ansible
- Update the /etc/ansible/hosts file to include host, group, private IP address and this    python interpreter: ansible_python_interpreter=/usr/bin/python3
- Run the playbook, and navigate to curl localhost/setup.php to check that the installation worked as expected.
The playbooks are listed as
 install-elk.yml 
filebeat-playbook.yml 
metricbeat-playbook.yml. 
They are copied to the /etc/ansible directory.

In order for the playbook to run on a specific machine the /etc/ansible/hosts need to be updated to reflect the different groups. In this network there are two groups [webservers] [elk] with their respective ip address and python translator.
Run the playbook and navigate to Kibana with the public ip:5601/app/kibana


_As a **Bonus**, provide the specific commands the user will need to run to download the playbook, update the files, etc._


