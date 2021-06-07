# Elk-Stack
##  UofU Cyber Security Bootcamp ELK Stack Project
### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application. By simply logging in to the JumpBox changes and modifications to the different containers and vm's can be deployed from this one single VM. 

Load balancing ensures that the application will be highly effective and efficient,in addition to restricting un-authorized access to the network. The Load Balancer functionality provides the ability to redirect excess traffic to the cloud so applications are able to remain available. Because of its policy controls is able to stop bad traffic from ever reaching the application. In simple words, it contributes a great deal in preventing DDos attacks. 

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the netwrok and system logs.

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
