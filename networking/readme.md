# DNS Configuration with Cloudflare and AWS EC2: NGINX and Apache Server Setup

This project demonstrates how I set up two web servers (NGINX and Apache) on AWS EC2 instances and configured DNS to point my domain name (`najiib.co.uk`) to these servers. I used **Cloudflare** for DNS management and demonstrated basic network troubleshooting techniques like `ping`, `nslookup`, and `traceroute`.

## Overview
- **Technology Stack**:
  - AWS EC2 Instances
  - NGINX Web Server
  - Apache Web Server
  - Cloudflare for DNS Management
  - Basic Networking Tools: `ping`, `nslookup`, `traceroute`
  
- **Objectives**:
  1. Launch two AWS EC2 instances, one hosting **NGINX** and the other **Apache**.
  2. Configure DNS in Cloudflare to point subdomains (`nginx.najiib.co.uk` and `apache.najiib.co.uk`) to each respective server.
  3. Use basic troubleshooting tools to verify network setup and DNS propagation.

## AWS EC2 Setup

1. **Launch Two EC2 Instances**:
   - Created two EC2 instances running **Ubuntu 20.04**.
   - Configured **Security Groups** to allow **HTTP (Port 80)** and **SSH (Port 22)** access.
   
2. **Install NGINX** on one instance:
   - Connected to the EC2 instance using SSH and ran the following commands:
     ```bash
     sudo apt update
     sudo apt install nginx -y
     sudo systemctl start nginx
     sudo systemctl enable nginx
     ```
   - The default NGINX page is now served from this instance.

3. **Install Apache** on the second instance:
   - Connected to the second EC2 instance via SSH and ran the following commands:
     ```bash
     sudo apt update
     sudo apt install apache2 -y
     sudo systemctl start apache2
     sudo systemctl enable apache2
     ```
   - The default Apache page is now served from this instance.

## DNS Configuration with Cloudflare

1. **Set up Cloudflare DNS Records**:
   - Logged into my Cloudflare account and selected my domain `najiib.co.uk`.
   - Added **A records** for both `nginx.najiib.co.uk` and `apache.najiib.co.uk`, pointing them to the respective public IPs of the EC2 instances.
   
2. **DNS Records**:
   - **A Record (nginx.najiib.co.uk)**:
     - Type: A
     - Name: nginx.najiib.co.uk
     - Value: 35.179.107.254
     - TTL: Auto
     
   - **A Record (apache.najiib.co.uk)**:
     - Type: A
     - Name: apache.najiib.co.uk
     - Value: 35.179.107.254
     - TTL: Auto

## Screenshots of Working NGINX and Apache Servers

### NGINX Server (`nginx.najiib.co.uk`)
![image](https://github.com/user-attachments/assets/03ab50cd-35a9-4b79-a1a4-e286bd6192e6)


### Apache Server (`apache.najiib.co.uk`)
![image](https://github.com/user-attachments/assets/5e284105-ac6d-483c-9649-ecf942e01a88)


## Network Troubleshooting

1. **Ping Test**:
   Verified that both subdomains (`nginx.najiib.co.uk` and `apache.najiib.co.uk`) are reachable by using the `ping` command.
   ```bash
   ping nginx.najiib.co.uk
   ping apache.najiib.co.uk
