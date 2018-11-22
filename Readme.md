# Project Title

Script for pfSense to bypass snort based on authenticated OpenVPN login

## Getting Started

This project is made of 4 files.
* scripts.tar.gz
* install.sh
* uninstall.sh

This project is for clearing all blocked IPs from Snort on pfSense once per minute, based on IPs of users logged in to OpenVPN.
When a user authenticates on OpenVPN, their public IP should be stored in a table or database with a timestamp.
Each minute, a cron job should run to clear any blocked IPs that match authenticated OpenVPN sessions within a day.
At the start of a new day, the IPs should be dropped from the table of IPs to keep clearing.

### Prerequisites

This script works on pfSense installed following packages.

```
pfSense
   pfSense is an open source firewall/router computer software distribution based on FreeBSD.
1. Snort
   Snort is an open-source, free and lightweight network intrusion detection system (NIDS) software for Linux and Windows to detect emerging threats.
   You can install snort on pfSense in "pfSense Web Page/System/Package Manager/Available Packages/ search snort".
   If you don't sure how to install Snort on pfSense, please follow this URL.
   		https://www.youtube.com/watch?v=-GgqYq5-EBg
2. OpenVPN
   OpenVPN is a free and open-source software application that implements virtual private network (VPN) techniques to create secure point-to-point or site-to-site connections in routed or bridged configurations and remote access facilities.
   It uses a custom security protocol that utilizes SSL/TLS for key exchange.
   You can install OpenVPN on pfSense in "pfSense Web Page/System/Package Manager/Available Packages/ search openvpn-client-export".
   If you don't sure how to install OpenVPN on pfSense, please follow this URL.
   		https://www.youtube.com/watch?v=xiy52Hn5bTc
3. Cron
   cron is a Linux utility which schedules a command or script on your server to run automatically at a specified time and date. 
   A cron job is the scheduled task itself. Cron jobs can be very useful to automate repetitive tasks.
   You can install Cron on pfSense in "pfSense Web Page/System/Package Manager/Available Packages/ search Cron".
   Actually, Cron installing is same as above and simply can be done.
   In addition, If you don't sure how to schedule a project using Cron, please follow this URL.
   		https://www.youtube.com/watch?v=69NLkjja6e4
```

### Installing and Uninstalling

Installing and uninstalling is very simple. After copy these files in your home directory on pfSense system, you can do that by only executing install.sh/uninstall.sh file.

Install
```
./install.sh
```

Uninstall
```
./uninstall.sh
```

## Running results

You can see the result of this script(which blocked ip has been cleared by this script) by running the following command.
```
vi /etc/Cleared_Blocked_IP.tbl
```
## Deployment

As the result of installing of this script, you can see new files in /etc/ folder
```
add_ovpn_tbl.sh
clear_snort_blist.sh
cleanup_newday.sh

Cleared_Blocked_IP.tbl
OpenVPN_Client_List.tbl
```

You can also check if the Cron has been configured correctly by running:
```
crontab -l
```
## Version

1.0

## Authors

Raymond Rayne, Canada
Rostyslav Zhurba, Ukraine
