#!/bin/bash

set -e

DCC_CLI="/opt/dell/dcc/cctk"
EXPORT_PATH="$HOME/bios_config.ini"
DEB_URL="https://dl.dell.com/FOLDER10470419M/1/dell-command-configure_4.10.0-23.ubuntu22_amd64.deb"
DEB_FILE="/tmp/dell-command-configure.deb"

echo "=== Dell BIOS Export ==="

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

echo "[*] Exporting BIOS config to $EXPORT_PATH..."
sudo "$DCC_CLI" --save="$EXPORT_PATH"

if [ -f "$EXPORT_PATH" ]; then
    echo "[+] Export complete: $EXPORT_PATH"
else
    echo "[!] Export failed. Check if this device is supported and run with sudo if needed."
    exit 1
fi