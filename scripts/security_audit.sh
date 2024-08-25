#!/bin/bash

# Load configuration and custom checks
source $(dirname $0)/config.sh
source $(dirname $0)/custom_checks.sh

# 1. User and Group Audits
echo "Starting User and Group Audits..."
# List all users and groups
cut -d: -f1 /etc/passwd
cut -d: -f1 /etc/group
# Check for users with UID 0
awk -F: '($3 == 0) {print}' /etc/passwd
# Check for users without passwords or weak passwords
for user in $(awk -F: '($2 == "") {print $1}' /etc/shadow); do
  echo "User without password: $user"
done

# 2. File and Directory Permissions
echo "Starting File and Directory Permissions Audit..."
# World-writable files
find / -type f -perm -o+w
# SUID/SGID bits set
find / -perm /6000 -type f

# 3. Service Audits
echo "Starting Service Audits..."
# List running services
systemctl list-units --type=service --state=running
# Critical services
systemctl status sshd
systemctl status iptables

# 4. Firewall and Network Security
echo "Starting Firewall and Network Security Audit..."
# Firewall status
ufw status
# Open ports
netstat -tulpn | grep LISTEN
# IP forwarding check
sysctl net.ipv4.ip_forward
sysctl net.ipv6.conf.all.forwarding

# 5. IP and Network Configuration Checks
echo "Starting IP and Network Configuration Checks..."
# List IP addresses
ip addr show
# Check for public vs. private IPs
# ...

# 6. Security Updates and Patching
echo "Checking for Security Updates..."
apt update
apt list --upgradable

# 7. Log Monitoring
echo "Starting Log Monitoring..."
# Check for suspicious log entries
grep "Failed password" /var/log/auth.log

# 8. Execute custom checks
execute_custom_checks
