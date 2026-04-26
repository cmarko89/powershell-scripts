#!/bin/bash

set -e

DCC_CLI="/opt/dell/dcc/cctk"
EXPORT_PATH="$HOME/bios_config.ini"
TAR_URL_22="https://dl.dell.com/FOLDER12705833M/1/command-configure_5.1.0-6.ubuntu22_amd64.tar.gz"
TAR_URL_24="https://dl.dell.com/FOLDER12705845M/1/command-configure_5.1.0-6.ubuntu24_amd64.tar.gz"
TMP_DIR="/tmp/dcc-install"

echo "=== Dell BIOS Export ==="

install_dcc() {
    UBUNTU_VER=$(lsb_release -rs)
    if [[ "$UBUNTU_VER" == 24* ]]; then
        TAR_URL="$TAR_URL_24"
    else
        TAR_URL="$TAR_URL_22"
    fi

    echo "[*] Downloading Dell Command | Configure..."
    mkdir -p "$TMP_DIR"
    curl -fSL -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36" "$TAR_URL" -o "$TMP_DIR/dcc.tar.gz"

    echo "[*] Extracting..."
    tar -zxf "$TMP_DIR/dcc.tar.gz" -C "$TMP_DIR"

    echo "[*] Installing packages..."
    sudo dpkg -i "$TMP_DIR"/srvadmin-hapi_*.deb 2>/dev/null || true
    sudo dpkg -i "$TMP_DIR"/command-configure_*.deb
    sudo apt-get install -f -y

    rm -rf "$TMP_DIR"
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
sudo "$DCC_CLI" -O "$EXPORT_PATH"

if [ -f "$EXPORT_PATH" ]; then
    echo "[+] Export complete: $EXPORT_PATH"
else
    echo "[!] Export failed. Ensure this is a supported Dell device and run with sudo if needed."
    exit 1
fi