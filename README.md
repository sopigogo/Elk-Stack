# Elk-Stack
##  UofU Cyber Security Bootcamp ELK Stack Project
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

Points to a group of machines along to the remote user:

-name: Configure elk VM with Docker
 hosts: elk
 remote_user: sysadmin
 tasks:

Increase System Memory:

-name: Use more memory
systctl:
  name: vm.max_map_count
  value: 262144
  state: present
  reload: yes

Installation of following services:
  
'docker.io'
'python3-pip'
"docker' docker python pip module.

To launch and expose container with published ports:

'5601:5601'
'9200:9200'
'5044:5044'
