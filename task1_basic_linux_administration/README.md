Basic Linux Administration

--- Overview

This task covers the foundational concepts of Linux administration, including user management, file system navigation, permissions, package management, and Bash scripting. 

1. Linux VM Setup

Installed Ubuntu 24.04 LTS using Oracle VirtualBox Manager.

2. User Management

--- Create New User

Created a new user account called 'newuser' using the command:
$ sudo adduser newuser

The command prompted to create a password for 'newuser' and change the user information for 'newuser'

--- Create New Password for User

Created a new password for 'newuser' using the command
$ sudo passwd newuser

--- Add User to the 'sudo' Group

Added user to the sudo group for administrative privileges using the command:
$ sudo usermod -aG sudo newuser

To check 'newuser' was successfully added to the sudo group
Run command
$ groups newuser

This lists out all the groups that 'newuser' belongs to.

--- Create New Group

Created new group 'globaltech' using the command:
$ sudo groupadd globaltech

and added 'newuser' to the 'globaltech' group using the command:
$ sudo usermod -aG globaltech newuser


--- Remove User From Group

Removed 'newuser' from 'globaltech' group using the command:
$ sudo deluser newuser globaltech

and deleted the 'globaltech' group using the command:
$ sudo groupdel globaltech

3. Password Policies

Viewed password policies in /etc/login.defs using the command:
$ sudo nano /etc/login.defs

Applied password policies to user 'ahnnie' using the command:
$ sudo chage -M 90 -m 1 -W 7 ahnnie

and confirmed that the policies has been set using the command:
$ sudo chage -l ahnnie

4. File System Navigation & Permissions

Changed the current dirctory to home using the command:
$ cd /home

Listed contents of current directory using the command:
$ ls

Changed the current dirctory to /home/ahnnie using the command:
$ cd /home/ahnnie

Enter Pictures folder inside /home/ahnnie using the command:
$ cd Pictures/

Moved up one directory to /home/ahnnie using the command:
$ cd ..

Print current directory using the command:
$ pwd

5. Package Management

Updated the package list & installed the nginx package using the command:
$ sudo apt update && sudo apt install nginx -y

Removed the nginx package using the command:
$ sudo apt remove nginx

6. Bash Scripting

--- Script Creation

Created a new file using the touch command:
$ touch user_report.sh

Used nano editor to create the bash script:
$ nano user_report.sh

#!/bin/bash
echo "User Report"
echo "Number of users: $(who | wc -l)"
echo "Free disk space: "
df -h

This script will display:

- Number of users on the system
- Free disk space

Make Script Executable using the command:
$ chmod +x user_report.sh

Run script to display the number of users on the system and free disk space using the command:
$ ./user_report.sh

--- Summary
- Set up an Ubuntu 24.04 virtual machine using Oracle VirtualBox.
- Created and managed user accounts, groups, and sudo permissions.
- Applied password policies and confirmed specific user password policies.
- Navigated file systems.
- Installed, updated, and removed software packages using APT.
- Created a bash script to display the number of users on the system and free disk space
