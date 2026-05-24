#!/usr/bin/env bash
# ===========================================================================
# Script Name  : ubuntu-keepawake.sh
# Version      : 1.0.0
# Author       : Richard Pierre
# Last Updated : 2026-05-24
# ===========================================================================
#
# SYNOPSIS
#   Installs a lightweight keep-awake utility on Ubuntu.
#
# DESCRIPTION
#   Disables screensaver/lock via gsettings and installs a systemd user
#   service that jiggles the mouse every 4 minutes to prevent idle
#   detection on X11.  On Wayland, gsettings alone handles lock/suspend;
#   the xdotool jiggle is silently skipped (Wayland blocks it).
#
# REQUIREMENTS
#   - Ubuntu 20.04+ with GNOME desktop
#   - Run as a regular (non-root) user
#   - sudo rights (only needed to install xdotool if absent)
#
# CONFIGURATION
#   JIGGLE_INTERVAL   Seconds between mouse nudges (default: 240)
#
# USAGE
#   chmod +x ubuntu-keepawake.sh && ./ubuntu-keepawake.sh
#   ./ubuntu-keepawake.sh --uninstall   # remove everything
#
# NOTES
#   - On X11 the service requires DISPLAY to be available; the unit file
#     exports DISPLAY=:0 which covers the common single-monitor case.
#     If your display is on a different number, edit the service unit after
#     install: ~/.config/systemd/user/keepawake.service
#   - gsettings changes are applied immediately and restored on --uninstall.
#
# CHANGE LOG
#   1.0.0  2026-05-24  Initial release
# ===========================================================================

set -euo pipefail

SERVICE_NAME="keepawake"
SERVICE_FILE="$HOME/.config/systemd/user/${SERVICE_NAME}.service"
JIGGLE_SCRIPT="$HOME/.local/bin/keepawake-jiggle.sh"
JIGGLE_INTERVAL=240  # seconds between mouse nudges

log() { echo "[keepawake] $*"; }
err() { echo "[keepawake] ERROR: $*" >&2; exit 1; }

uninstall() {
    log "Stopping and removing keepawake service..."
    systemctl --user stop    "${SERVICE_NAME}.service" 2>/dev/null || true
    systemctl --user disable "${SERVICE_NAME}.service" 2>/dev/null || true
    rm -f "$SERVICE_FILE" "$JIGGLE_SCRIPT"
    systemctl --user daemon-reload 2>/dev/null || true
    log "Restoring default lock/screensaver settings..."
    gsettings reset org.gnome.desktop.screensaver lock-enabled                          2>/dev/null || true
    gsettings reset org.gnome.desktop.screensaver idle-activation-enabled               2>/dev/null || true
    gsettings reset org.gnome.desktop.session     idle-delay                            2>/dev/null || true
    gsettings reset org.gnome.settings-daemon.plugins.power sleep-inactive-ac-type      2>/dev/null || true
    gsettings reset org.gnome.settings-daemon.plugins.power sleep-inactive-battery-type 2>/dev/null || true
    log "Uninstall complete."
    exit 0
}

[[ "${1:-}" == "--uninstall" ]] && uninstall

# Require non-root — systemd user services don't run under root
[[ "$EUID" -eq 0 ]] && err "Run as your regular user, not root. sudo is not needed."

# Install xdotool if missing (X11 jiggle; harmless to install on Wayland)
if ! command -v xdotool &>/dev/null; then
    log "Installing xdotool..."
    sudo apt-get install -y xdotool
fi

# Create dirs
mkdir -p "$(dirname "$JIGGLE_SCRIPT")"
mkdir -p "$(dirname "$SERVICE_FILE")"

# Write the jiggle script
cat > "$JIGGLE_SCRIPT" <<'JIGGLE'
#!/usr/bin/env bash
# Nudges the mouse pointer 1 px and back to reset the X11 idle timer.
# On Wayland DISPLAY is unset so this exits cleanly without effect.
if [[ -n "${DISPLAY:-}" ]]; then
    xdotool mousemove_relative -- 1 0
    xdotool mousemove_relative -- -1 0
fi
JIGGLE
chmod +x "$JIGGLE_SCRIPT"

# Write the systemd user service
# DISPLAY is exported so xdotool can reach the X server.
# Adjust the value if your display number is not :0.
cat > "$SERVICE_FILE" <<SERVICE
[Unit]
Description=Keep-awake jiggle service
After=graphical-session.target

[Service]
Type=simple
Environment=DISPLAY=:0
ExecStart=/bin/bash -c 'while true; do ${JIGGLE_SCRIPT}; sleep ${JIGGLE_INTERVAL}; done'
Restart=on-failure
RestartSec=10

[Install]
WantedBy=default.target
SERVICE

# Apply gsettings to disable screen lock and idle suspend
log "Applying gsettings: disabling screensaver, lock, and idle suspend..."

gsettings set org.gnome.desktop.screensaver lock-enabled                          false
gsettings set org.gnome.desktop.screensaver idle-activation-enabled               false
gsettings set org.gnome.desktop.session     idle-delay                            0

# Prevent suspend on AC and battery (|| true: key absent on some GNOME builds)
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-type      'nothing' 2>/dev/null || true
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-battery-type 'nothing' 2>/dev/null || true

# Enable and start the service
systemctl --user daemon-reload
systemctl --user enable "${SERVICE_NAME}.service"
systemctl --user start  "${SERVICE_NAME}.service"

log "Done. Service status:"
systemctl --user status "${SERVICE_NAME}.service" --no-pager
log ""
log "To remove: ./ubuntu-keepawake.sh --uninstall"
