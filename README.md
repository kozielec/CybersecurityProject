# Automated ELK Stack Deployment
The files in this repository were used to configure the network depicted below：

[![](https://github.com/kozielec/CybersecurityProject/blob/main/Diagrams/Project%201.png)]
> ELK Diagram
https://github.com/kozielec/CybersecurityProject/blob/master/Diagrams/Project%201.png

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the `elk_script.yml` may be used to install only certain pieces of it, such as Filebeat.

https://github.com/kozielec/CybersecurityProject/blob/master/Ansible/elk_script.yml

------------


#This document contains the following details:

- Description of the Topology
- Access Policies
- ELK Configuration
- Target Machines & Beats
- Using the Playbook

------------

#Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly available, in addition to restricting access to the network.

Load Balancing plays an important security role as computing moves evermore to the cloud. The off-loading function of a load balancer defends an organization against distributed denial-of-service (DDoS) attacks. It does this by shifting attack traffic from the corporate server to a public cloud provider.
A load balancer can add additional layers of security to your website without any changes to your application.

- Protect applications from emerging threats
- The Web Application Firewall (WAF) in the load balancer protects your website from hackers and includes daily rule updates just like a virus scanner

- Authenticate User Access
- The load balancer can request a username and password before granting access to your website to protect against unauthorized access

- Protect against DDoS attack
- The load balancer can detect and drop distributed denial-of-service (DDoS) traffic before it gets to your website

- Simplify PCI compliance
- If you process credit cards, you need to comply with Payment Card Industry (PCI) regulations. A load balancer simplifies compliance with PCI rules

When we create a virtual machine in the Azure cloud. This virtual machine is on the virtual network on the Azure cloud is called Jumpbox also named as Jump server. Using this Jumbox VM, we can connect to the other Azure VM's using dynamic IP. Jump box prevents all Azure VM's to expose to the public.

Jump box is an intermediary host or an SSH gateway to a remote network, through which a connection can be made to another host in a dissimilar security zone, for example a demilitarized zone (DMZ). It bridges two dissimilar security zones and offers controlled access between them.
A jump box advantage is that it is a secure computer that all admins first connect to before launching any administrative task or use as an origination point to connect to other servers or untrusted environments.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the database and system logs.
Filebeat monitors the log files or locations that you specify, collects log events, and forwards them either to Elasticsearch or Logstash for indexing.
Elasticsearch is a special database for storing log data.


Logstash is a tool that makes it easy to collect logs from any machine.


Kibana allows analysts to easily visualize your data in complex ways.


Together, these three tools provide security specialists with everything they need to monitor traffic in any network.
Metricbeat collects machine metrics, such as uptime.  A metric is simply a measurement about an aspect of a system that tells analysts how "healthy" it is.


Common metrics include:


CPU usage: The heavier the load on a machine's CPU, the more likely it is to fail. Analysts often receive alerts when CPU usage gets too high.


Uptime: Uptime is a measure of how long a machine has been on. Servers are generally expected to be available for a certain percentage of the time, so analysts typically track uptime to ensure your deployments meet service-level agreements (SLAs).


Metricbeat makes it easy to collect specific information about the machines in the network. Filebeat enables analysts to monitor files for suspicious changes.




The configuration details of each machine may be found below.

| Name  |Function   | IP Address  |  Operating System |
| ------------ | ------------ | ------------ | ------------ |
| Jump Box  |  Gateway | 10.0.0.1  |  Linux |
|Web-1 DVWA   | Metricbeat/Filebeat  |  10.0.0.7 |  Linux |
| Web-2 DVWA  |Metricbeat/Filebeat   |10.0.0.6   |  Linux |
|  ELK-VM | Elk Stack Docker  | 10.2.0.4  | Linux  |




------------


# Access Policies
The machines on the internal network are not exposed to the public Internet.

Only the Jump Box machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
99.79.44.71
10.0.0.7
and 
10.0.0.6
Machines within the network can only be accessed by SSH port 22.

Web1/DVWA machine allows to access ELK VM with private IP address 10.0.0.7 and 10.0.0.6

A summary of the access policies in place can be found in the table below.

| Name  |  Publicly Accessible |Allowed IP Addresses   |
| ------------ | ------------ | ------------ |
| Jump Box  |  Yes |  99.79.44.71 |
|  Elk Configuration | Yes  | 99.79.44.71/10.0.0.7/10.0.0.6|



Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because Ansible is a configuration management platform that automates storage, servers, and networking. When you use Ansible to configure these components, difficult manual tasks become repeatable and less vulnerable to error.

The playbook implements the following tasks:

Steps of the Elk VM installation:
1. Install docker.io
2. Install python3-pip
3. Install Docker python module pip
4. Use more memory sysctl
5. Download and launch a docker elk container

The following screenshot displays the result of running docker ps after successfully configuring the ELK instance.

ELK Docker：

[![](https://github.com/kozielec/CybersecurityProject/blob/master/Images/elk%20docker%20ps.png)]

>elk docker image
https://github.com/kozielec/CybersecurityProject/blob/master/Images/elk%20docker%20ps.png


------------


# Target Machines & Beats

------------



This ELK server is configured to monitor the following machines:

Web1/DVWA 10.0.0.7
Web2/DVWA 10.0.0.6

We have installed the following Beats on these machines:`command: curl -L -O https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-7.4.0-amd64.deb`

These beats allow us to collect the following information from each machine:
Beats are special-purpose data collection modules. Rather than collecting all of a machine's log data, Beats allow you to collect only the very specific pieces you are interested in.
An ELK monitoring stack within my virtual network allows to monitor the performance of your web server that is running DVWA.

In particular, the ELK stack allows analysts to:

- Easily collect logs from multiple machines into a single database.

- Quickly execute complex searches, such as: Find the 12 internal IP addresses that sent the most HTTP traffic to my gateway between 4 a.m. and 8 a.m. in April 2019.

- Build graphs, charts, and other visualizations from network data.

- Explore the web server logs to see if there's anything unusual, example:  what country produced the majority of the traffic on the website

------------



# Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned:

SSH into the control node and follow the steps below:

Copy the `config_files/filebeat-config.yml` file to `/etc/ansible/files/filebeat-config.yml`

Update the filebeat-config.yml file to include :

Scroll to line #1106 and replace the IP address with the IP address of your ELK machine.

```bash
output.elasticsearch:
hosts: ["10.1.0.4:9200"]
username: "elastic"
password: "changeme"
```

Scroll to line #1806 and replace the IP address with the IP address of your ELK machine.

```
setup.kibana:
host: "10.1.0.4:5601"
```
Save this file in  `/etc/ansible/files/filebeat-config.yml`.

After you have edited the file, your settings should resemble the below. Your IP address may be different, but all other settings should be the same, including ports.

  ```
  output.elasticsearch:
  hosts: ["10.1.0.4:9200"]
  username: "elastic"
  password: "changeme"

  ...

  setup.kibana:
  host: "10.1.0.4:5601"
  ```

After entering your information into the Filebeat configuration file and Ansible playbook, run the playbook, `ansible-playbook filebeat-playbook.yml`.

Then navigate to http://52.254.52.49:5601/app/kibana to check that the installation worked as expected.
