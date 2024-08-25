# Security Audit and Server Hardening

This project provides a modular and reusable Bash script for automating the security audit and hardening process on Linux servers. The script is designed to be easily deployable across multiple servers, ensuring they meet stringent security standards.

## Features
- User and group audits
- File and directory permissions checks
- Service audits
- Firewall and network security verification
- IP and network configuration checks
- Security updates and patching
- Log monitoring
- Customizable security checks
- Server hardening measures

## Prerequisites
- Linux server (tested on Ubuntu 20.04)
- Bash shell

## Installation
1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/security-audit-hardening.git
   cd security-audit-hardening

# Security Audit and Server Hardening on Linux Servers

## Overview

This project provides a Bash script designed to automate both the security audit and hardening process of Linux servers. The script is modular, reusable, and can be easily deployed across multiple servers to ensure they meet stringent security standards. It includes checks for common security vulnerabilities, IPv4/IPv6 configurations, public vs. private IP identification, and implements hardening measures.

## Features

- **User and Group Audits**
  - List all users and groups.
  - Identify users with UID 0 (root privileges) and report any non-standard users.
  - Report users without passwords or with weak passwords.
  
- **File and Directory Permissions**
  - Scan for files and directories with world-writable permissions.
  - Ensure `.ssh` directories have secure permissions.
  - Report files with SUID or SGID bits set, particularly on executables.
  
- **Service Audits**
  - List all running services and identify any unnecessary or unauthorized services.
  - Ensure critical services (e.g., `sshd`, `iptables`) are running and properly configured.
  - Check that no services are listening on non-standard or insecure ports.
  
- **Firewall and Network Security**
  - Verify that a firewall (e.g., `iptables`, `ufw`) is active and configured to block unauthorized access.
  - Report any open ports and their associated services.
  - Check for IP forwarding or other insecure network configurations.
  
- **IP and Network Configuration Checks**
  - Identify whether the server’s IP addresses are public or private.
  - Provide a summary of all IP addresses, specifying which are public and which are private.
  - Ensure sensitive services (e.g., SSH) are not exposed on public IPs unless required.
  
- **Security Updates and Patching**
  - Check for available security updates or patches.
  - Ensure the server is configured to receive and install security updates regularly.
  
- **Log Monitoring**
  - Check for recent suspicious log entries, such as too many login attempts on SSH.
  
- **Server Hardening**
  - Implement SSH key-based authentication and disable password-based login for root.
  - Disable IPv6 if not in use.
  - Secure the GRUB bootloader with a password.
  - Configure the firewall with recommended rules.
  - Enable automatic security updates.

- **Custom Security Checks**
  - Easily extend the script with custom security checks based on specific organizational policies.
  
- **Reporting and Alerting**
  - Generate a summary report of the security audit and hardening process.
  - Optionally, configure the script to send email alerts or notifications if critical vulnerabilities or misconfigurations are found.

## Prerequisites

- A Linux server (tested on Ubuntu 20.04, should work on most Linux distributions).
- Bash shell.
- Access to the server with sudo privileges.

## Installation

1. **Clone the Repository**
   ```bash
   git clone https://github.com/yourusername/security-audit-hardening.git
   cd security-audit-hardening
   ```

2. **Review and Configure**
   - **Configuration Files:** Customize security checks and hardening rules in the `config/` directory.
   - **Scripts:** Review the scripts in the `scripts/` directory to ensure they meet your specific requirements.

## Usage

### Running the Security Audit

To perform a security audit on your server, run the following command:

```bash
bash scripts/security_audit.sh
```

This script will:
- List users and groups.
- Check for users with UID 0 and weak passwords.
- Scan for world-writable files, SUID/SGID bits, and other security risks.
- Audit running services and firewall configurations.
- Verify IP configurations and perform log monitoring.

### Applying Server Hardening

To apply server hardening measures, run the following command:

```bash
bash scripts/hardening.sh
```

This script will:
- Implement SSH hardening.
- Disable IPv6 if not required.
- Secure the GRUB bootloader.
- Configure the firewall with recommended rules.
- Enable automatic security updates.

### Custom Security Checks

To extend the script with custom security checks:
1. Add your checks to the `scripts/custom_checks.sh` file.
2. Define any necessary configuration in `config/custom_checks.conf`.

### Reporting

After running the scripts, the output will be displayed in the terminal. If you wish to generate a report file, you can redirect the output:

```bash
bash scripts/security_audit.sh > audit_report.txt
bash scripts/hardening.sh > hardening_report.txt
```

## Execution on AWS EC2

1. **Launch an EC2 Instance**
   - Go to the AWS Management Console.
   - Navigate to the EC2 dashboard and click "Launch Instance."
   - Choose an Amazon Linux 2 or Ubuntu AMI.
   - Select an instance type (e.g., t2.micro for testing).
   - Configure security groups to allow SSH access.
   - Launch the instance and connect to it via SSH.

2. **Clone the Repository**
   ```bash
   git clone https://github.com/yourusername/security-audit-hardening.git
   cd security-audit-hardening
   ```

3. **Run the Scripts**
   - Perform a security audit:
     ```bash
     bash scripts/security_audit.sh
     ```
   - Apply server hardening measures:
     ```bash
     bash scripts/hardening.sh
     ```

## Contribution

Contributions are welcome! If you find a bug or have an idea for an enhancement, feel free to submit an issue or a pull request.

## License

This project is licensed under the MIT License. See the `LICENSE` file for details.

---

### Summary

This `README.md` provides a detailed overview of your project, including instructions for installation, usage, and contribution. It's designed to be user-friendly and should make it easy for others to understand and use your scripts. Make sure to replace `"https://github.com/Ashishm96/security-audit-hardening.git"` with your actual GitHub repository URL before publishing.