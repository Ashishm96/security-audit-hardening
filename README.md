# Security Audit and Server Hardening

Welcome to the Security Audit and Server Hardening project! This repository contains Bash scripts designed to automate security audits and server hardening processes on Linux servers. The scripts are modular, reusable, and easily deployable across multiple servers to ensure compliance with stringent security standards.

## Project Structure

The project is organized as follows:

```
security-audit-hardening/
├── scripts/
│   ├── security_audit.sh
│   ├── hardening.sh
│   ├── custom_checks.sh
│   └── config.sh
├── config/
│   ├── custom_checks.conf
│   └── firewall_rules.conf
├── README.md
└── LICENSE
```

### Scripts

- **`security_audit.sh`**: Performs a comprehensive security audit on the server.
- **`hardening.sh`**: Applies hardening measures to secure the server.
- **`custom_checks.sh`**: Contains custom security checks that can be extended based on specific organizational needs.
- **`config.sh`**: Configuration file for setting environment variables and paths.

### Configuration Files

- **`custom_checks.conf`**: Defines custom security checks.
- **`firewall_rules.conf`**: Contains rules for firewall configuration.

## Installation

1. **Clone the Repository**

   First, clone the repository to your local machine or server:

   ```bash
   git clone https://github.com/Ashishm96/security-audit-hardening.git
   cd security-audit-hardening
   ```

2. **Configure Custom Checks**

   Edit the `config/custom_checks.conf` file to include any custom security checks you need. This file can be extended with additional checks as per your requirements.

3. **Configure Firewall Rules**

   Update `config/firewall_rules.conf` with the appropriate firewall rules based on your network security policies.

## Usage

### Running the Security Audit

The `security_audit.sh` script performs various security checks on the server. To execute it:

```bash
bash scripts/security_audit.sh
```

#### Commands Used:

- **User and Group Audits**
  ```bash
  cut -d: -f1 /etc/passwd
  cut -d: -f1 /etc/group
  awk -F: '($3 == 0) {print}' /etc/passwd
  awk -F: '($2 == "") {print $1}' /etc/shadow
  ```

- **File and Directory Permissions**
  ```bash
  find / -type f -perm -o+w
  find / -perm /6000 -type f
  ```

- **Service Audits**
  ```bash
  systemctl list-units --type=service --state=running
  systemctl status sshd
  systemctl status iptables
  ```

- **Firewall and Network Security**
  ```bash
  ufw status
  netstat -tulpn | grep LISTEN
  sysctl net.ipv4.ip_forward
  sysctl net.ipv6.conf.all.forwarding
  ```

- **Security Updates and Patching**
  ```bash
  apt update
  apt list --upgradable
  ```

- **Log Monitoring**
  ```bash
  grep "Failed password" /var/log/auth.log
  ```

### Applying Hardening Measures

The `hardening.sh` script implements server hardening measures. Run it with:

```bash
bash scripts/hardening.sh
```

#### Commands Used:

- **SSH Hardening**
  ```bash
  sed -i 's/PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config
  systemctl restart sshd
  ```

- **Disable IPv6**
  ```bash
  echo "net.ipv6.conf.all.disable_ipv6 = 1" >> /etc/sysctl.conf
  echo "net.ipv6.conf.default.disable_ipv6 = 1" >> /etc/sysctl.conf
  sysctl -p
  ```

- **Secure the Bootloader**
  ```bash
  grub-mkpasswd-pbkdf2 | tee /etc/grub.d/40_custom <<EOF
  set superusers="root"
  password_pbkdf2 root <your_encrypted_password>
  EOF
  update-grub
  ```

- **Firewall Configuration**
  ```bash
  ufw default deny incoming
  ufw default allow outgoing
  ufw allow ssh
  ufw enable
  ```

- **Enable Automatic Updates**
  ```bash
  apt install unattended-upgrades
  dpkg-reconfigure --priority=low unattended-upgrades
  ```

### Custom Security Checks

The `custom_checks.sh` file allows for the inclusion of additional custom security checks. Modify it as needed and add your own checks.

## Execution on AWS EC2

1. **Launch an EC2 Instance**

   - Go to the AWS Management Console.
   - Navigate to the EC2 dashboard.
   - Click on "Launch Instance."
   - Choose an Amazon Linux 2 or Ubuntu AMI.
   - Select an instance type (e.g., t2.micro for testing).
   - Configure security groups to allow SSH access.
   - Launch the instance and connect to it via SSH.

2. **Clone the Repository on EC2**

   ```bash
   git clone https://github.com/Ashishm96/security-audit-hardening.git
   cd security-audit-hardening
   ```

3. **Run the Scripts**

   - **Security Audit:**
     ```bash
     bash scripts/security_audit.sh
     ```

   - **Server Hardening:**
     ```bash
     bash scripts/hardening.sh
     ```

4. **Review the Output**

   The scripts will output results directly to the terminal. Review any warnings or recommendations for further action.

## Reporting Issues

If you encounter any issues or have suggestions for improvements, please open an issue on the GitHub repository.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Contact

For any questions or feedback, you can reach me at [Ashish Makasare](mailto:ashishmakasare24@gmail.com).

---

Feel free to adjust the content as needed and make sure to replace placeholders with actual information relevant to your setup.

### Summary

This `README.md` provides a detailed overview of your project, including instructions for installation, usage, and contribution. It's designed to be user-friendly and should make it easy for others to understand and use your scripts. Make sure to replace `"https://github.com/Ashishm96/security-audit-hardening.git"` with your actual GitHub repository URL before publishing.
