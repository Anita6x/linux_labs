Networking and Web Servers

--- Overview

This task demonstrates key networking and web server administration concepts, including network configuration, firewall configuration, Nginx installation and configuration, and basic DNS concepts.

1. Network Configuration

Configure network settings and understand IP management using Linux tools.

Steps

Viewed IP address using:

- ifconfig
- ip addr show


Assigned a temporary static IP address:

$ sudo ip addr add 10.0.2.120/24 dev enp0s3
This sets a static IP for the active session.

The connection was confirmed through successful pings.

2. Firewall Configuration
Set up and manage basic firewall rules for web and SSH traffic.

Steps

Confirmed the status of ufw (uncomplicate firewall) using:
$ sudo ufw status
The output was inactive

Allowed the SSH, HTTPS traffic
$ sudo ufw allow ssh
$ sudo ufw allow https

Enabled ufw:

$ sudo ufw enable

Checked firewall status:
$ sudo ufw status

The output confirmed active firewall rules allowing SSH (port 22) and HTTPS (port 443).

3. Install and Configure Nginx
Install Nginx and host a basic HTML page.

Steps

Installed Nginx web server:

$ sudo apt update && sudo apt install nginx -y
$ sudo systemctl start nginx
$ sudo systemctl status nginx

Created a basic website in index.html file

Created an nginx server configuration block 
$ cd /etc/nginx
$ cd sites-available/
$ sudo nano task2

server {
    listen 80;
    server_name localhost;

    root /var/www/task2;
    index index.html;

    location / {

    }
}


Linked the configuration and tested:

$ sudo ln -s /etc/nginx/sites-available/task2 /etc/nginx/sites-enabled/
$ sudo nginx -t
$ sudo systemctl restart nginx

Test setup on terminal using:
$ curl http://localhost

and test on a browser by visiting http://localhost to display the index.html test page.

4. Domain Name System (DNS)
Understand and configure name resolution locally and using public DNS.

Steps

Checked DNS resolver:
$ cat /etc/resolv.conf

nameserver 127.0.0.53


Explored public DNS by adding Google’s DNS (8.8.8.8) to /etc/resolv.conf:
nameserver 8.8.8.8


Verified resolution using:
$ resolvectl status


--- Summary

- Configured and tested network settings using ip and ifconfig.
- Set up and enabled firewall rules using ufw.
- Installed and configured Nginx to host a basic webpage.
- Explored DNS resolution through public DNS settings.