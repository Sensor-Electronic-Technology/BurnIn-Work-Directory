#!/bin/bash

# Function to update the hostname
update_hostname() {
    echo "Current hostname: $(hostname)"
    read -p "Enter new hostname: " new_hostname

    sudo hostnamectl set-hostname "$new_hostname"

    echo "127.0.1.1    $new_hostname" | sudo tee -a /etc/hosts
    echo "Hostname updated to $new_hostname"
}

# Function to update WiFi configuration
update_wifi() {
    read -p "Enter WiFi SSID: " wifi_ssid
    read -sp "Enter WiFi Password: " wifi_password
    echo

    sudo tee /etc/wpa_supplicant/wpa_supplicant.conf > /dev/null <<EOL
ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
update_config=1
country=US

network={
    ssid="$wifi_ssid"
    psk="$wifi_password"
    key_mgmt=WPA-PSK
}
EOL

    sudo systemctl restart dhcpcd
    echo "WiFi configuration updated. Attempting to connect to $wifi_ssid"
}

# Function to update Ethernet configuration
update_ethernet() {
    read -p "Enter static IP address (leave blank for DHCP): " eth_ip
    read -p "Enter gateway (leave blank for DHCP): " eth_gateway
    read -p "Enter DNS server (leave blank for DHCP): " eth_dns

    if [[ -z "$eth_ip" ]]; then
        echo "Configuring Ethernet for DHCP"
        sudo tee /etc/dhcpcd.conf > /dev/null <<EOL
interface eth0
EOL
    else
        echo "Configuring Ethernet with static IP"
        sudo tee /etc/dhcpcd.conf > /dev/null <<EOL
interface eth0
static ip_address=$eth_ip/24
static routers=$eth_gateway
static domain_name_servers=$eth_dns
EOL
    fi

    sudo systemctl restart dhcpcd
    echo "Ethernet configuration updated"
}

# Main script
echo "Raspberry Pi Network Configuration Script"

update_hostname
update_wifi
update_ethernet

echo "All configurations updated. Please reboot your Raspberry Pi."
