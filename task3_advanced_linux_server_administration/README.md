Advanced linux server configuration

--- Overview

This task covers advanced Linux administration and web server concepts, focusing on:
- SSH key-based authentication
- Web server security with SSL/TLS
- Load balancing using Nginx
- Automated tasks using cron

1. SSH Key Authentication
Set up key-based SSH authentication for secure remote access and disable password authentication.

Steps

Generate SSH Key Pair (on the client machine):

$ ssh-keygen -t ed25519 - C "ahnnie@ubuntu"


Disable Password Authentication
Edit the SSH config:
$ sudo nano /etc/ssh/sshd_config


Find and set:
PasswordAuthentication no

Then restart SSH:
sudo systemctl restart ssh

$ ssh ahnnie@10.0.2.15
Only users with a valid SSH key can log in.

2. Web Server Security (Nginx + SSL/TLS)
Enable encrypted HTTPS connections using a self-signed SSL certificate and apply basic Nginx security best practices.

Steps

Generate a Self-Signed Certificate using:
$ sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
-keyout /etc/ssl/private/task2.key \
-out /etc/ssl/certs/task2.crt

and enter the required information 

Create a Secure Nginx Configuration:

server {
    listen 443 ssl;
    server_name localhost;

    ssl_certificate /etc/ssl/certs/task2.crt;
    ssl_certificate_key /etc/ssl/private/task2.key;

    root /var/www/task2;
    index index.html;

    location /{

    }
}

Result: Nginx serves content over HTTPS securely.

3. Load Balancing with Nginx
Set up Nginx as a simple load balancer to distribute traffic between multiple backend servers.

Configuration

File: /etc/nginx/sites-available/loadbalancer

upstream web_servers {
    server 10.0.2.15:9001;
    server 10.0.2.15:9002;
    server 10.0.2.15:9003;
}

server {
    listen 80;
    server_name localhost;
    proxy_set_header Host $host;
    proxy_set_header x-Forwarded-For $proxy_add_x_forwarded_for;
    proxy_set_header x-Real-IP $remote_addr;

    location /index {
        proxy_pass http://web_servers/;
   }
}


File: /etc/nginx/sites-available/web

server {
    listen 9001;
    index index.html;
    add_header Custom-Header "Application 1";

    location / {
        root /var/www/task2;
   }
}

server {
    listen 9002;
    index index.html;
    add_header Custom-Header "Application 2";

    location / {
        root /var/www/task2;
   }
}

server {
    listen 9003;
    index index.html;
    add_header Custom-Header "Application 3";

    location / {
        root /var/www/task2;
   }
}

Using:

$ curl -I http://localhost/index


Refresh multiple times — the response custom-header should alternate between the three servers.

Result: Load balancer distributes traffic across multiple backends.

4. Automated Tasks with Cron
Automate routine system tasks using the cron scheduler.

Check Cron Jobs using 
$ crontab -l

Edit Crontab:
$ crontab -e

Add Tasks:

System Update Every Monday

0 7 * * 1 sudo apt update && sudo apt upgrade -y >> /var/log/auto-update.log 2>&1

Number of User on the system and free disk space report every minute

*/1 * * * * /home/ahnnie/Documents/user_report.sh >> /var/log/health.log 2>&1

List Scheduled Cron Jobs:

crontab -l

Result: Routine tasks run automatically.

--- Summary
- SSH key authentication setup and password authentication disabled
- Configured Self-signed ssl certificate
- Nginx load balancing between backends
- Cron Jobs	Automated tasks added