#!/bin/bash

set -e

DCC_CLI="/opt/dell/dcc/cctk"
CONFIG_URL="https://raw.githubusercontent.com/YOUR_USERNAME/YOUR_REPO/main/bios_config.ini"
CONFIG_FILE="/tmp/bios_config.ini"
DEB_URL="https://dl.dell.com/FOLDER10470419M/1/dell-command-configure_4.10.0-23.ubuntu22_amd64.deb"
DEB_FILE="/tmp/dell-command-configure.deb"

echo "=== Dell BIOS Import ==="

install_dcc() {
    echo "[*] Downloading Dell Command | Configure..."
    curl -fsSL "$DEB_URL" -o "$DEB_FILE"
    echo "[*] Installing package..."
    sudo dpkg -i "$DEB_FILE" || sudo apt-get install -f -y
    rm -f "$DEB_FILE"
    echo "[*] Loading SMBIOS kernel module..."
    sudo modprobe dell_smbios 2>/dev/null || true
}

if [ ! -f "$DCC_CLI" ]; then
    echo "[*] DCC not found. Installing..."
    install_dcc
else
    echo "[*] DCC already installed."
fi

echo "[*] Downloading BIOS config from GitHub..."
curl -fsSL "$CONFIG_URL" -o "$CONFIG_FILE"

if [ ! -f "$CONFIG_FILE" ]; then
    echo "[!] Failed to download config. Check the URL and your internet connection."
    exit 1
fi

echo "[*] Applying BIOS config..."
sudo "$DCC_CLI" --import="$CONFIG_FILE"

echo "[+] Import complete. A reboot may be required for all settings to take effect."
rm -f "$CONFIG_FILE"