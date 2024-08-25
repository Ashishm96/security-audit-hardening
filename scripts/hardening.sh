#!/bin/bash

# Load configuration
source $(dirname $0)/config.sh

# 1. SSH Hardening
echo "Hardening SSH Configuration..."
sed -i 's/PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config
systemctl restart sshd

# 2. Disable IPv6
echo "Disabling IPv6..."
echo "net.ipv6.conf.all.disable_ipv6 = 1" >> /etc/sysctl.conf
echo "net.ipv6.conf.default.disable_ipv6 = 1" >> /etc/sysctl.conf
sysctl -p

# 3. Secure the Bootloader
echo "Securing GRUB bootloader..."
grub-mkpasswd-pbkdf2 | tee /etc/grub.d/40_custom <<EOF
set superusers="root"
password_pbkdf2 root <your_encrypted_password>
EOF
update-grub

# 4. Firewall Configuration
echo "Configuring Firewall..."
ufw default deny incoming
ufw default allow outgoing
ufw allow ssh
ufw enable

# 5. Enable Automatic Updates
echo "Enabling Automatic Updates..."
apt install unattended-upgrades
dpkg-reconfigure --priority=low unattended-upgrades
