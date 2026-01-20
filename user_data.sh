
#!/bin/bash
set -eux

# Update package index
apt update -y

# Install strongSwan
apt install -y strongswan

# Enable IPv4 forwarding (required for VPN routing)
echo "net.ipv4.ip_forward=1" >> /etc/sysctl.conf
sysctl -p

# Enable and start strongSwan (Ubuntu service name)
systemctl enable strongswan-starter
systemctl start strongswan-starter

# Prepare AWS VPN config file locations
touch /etc/ipsec.conf
touch /etc/ipsec.secrets
chmod 600 /etc/ipsec.secrets

# Log for verification
echo "strongSwan installed and configured successfully" > /var/log/strongswan-install.log
