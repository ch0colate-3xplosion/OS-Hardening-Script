#!/bin/bash
# Update and Upgrade Raspberry Pi
echo "Now updating Raspberry Pi"
sudo apt update -y &> /dev/null && apt upgrade -y &> /dev/null

echo "Disabling Wi-Fi and Bluetooth"
echo "Adding Disable Wi-Fi and Bluetooth to file config.txt"
cat > /boot/config.txt << EOF
# Uncomment this to disable WiFi and Bluetooth
dtoverlay=pi3-disable-wifi
dtoverlay=pi3-disable-bt
EOF

echo "Adding Disable Wi-Fi and Bluetooth to file raspi-blacklist.conf"
cat > /etc/modprobe.d/raspi-blacklist.conf << EOF
# disable WLAN
blacklist brcmfmac
blacklist brcmutil
blacklist cfg80211
blacklist rfkill

# disable Bluetooth
blacklist btbcm
blacklist hci_uart
EOF

echo "Now executing command update-initra,fs -u to block Wi-Fi and Bluetooth process"
sudo update-initramfs -u

echo "Installing fail2ban"
sudo apt install fail2ban -y &> /dev/null

echo "Installing chkrootkit and rkhunter"
sudo apt install chkrootkit -y &> /dev/null && sudo apt install rkhunter -y &> /dev/null

echo "Rebooting Raspberry Pi"
sudo reboot
