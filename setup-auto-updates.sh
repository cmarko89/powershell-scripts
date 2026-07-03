#!/usr/bin/env bash
# ===========================================================================
# Script Name  : setup-auto-updates.sh
# Version      : 1.0.0
# Author       : Emkraan Administrator
# Last Updated : 2026-05-21
# ===========================================================================
#
# SYNOPSIS
#   Configures unattended-upgrades on Ubuntu to apply all package updates
#   nightly at 2:00 AM and automatically reboot if required.
#
# DESCRIPTION
#   Installs unattended-upgrades and update-notifier-common, then writes
#   configuration files to:
#     - Enable ALL package origins (not just security)
#     - Schedule the apt timer to run at 02:00 with a ±30 min random spread
#     - Automatically reboot at 02:30 if a reboot is required
#     - Remove unused dependencies after upgrades
#     - Log to /var/log/unattended-upgrades/
#
#   The systemd apt-daily-upgrade.timer drives execution; no custom cron
#   entry or daemon is needed.
#
# REQUIREMENTS
#   - Ubuntu 20.04+
#   - Run as: root (sudo)
#
# DEPLOYMENT
#   Push this script to each host via your fleet management tool, then run:
#     sudo bash setup-auto-updates.sh
#
#   For Ansible, use the 'script' module or extract the tasks into a role.
#
# USAGE
#   sudo bash setup-auto-updates.sh [--dry-run]
#
# NOTES
#   - A random spread (RandomizedDelaySec) is applied so a fleet of machines
#     does not all hit the package mirror simultaneously.
#   - Reboot time is set to 02:30 to allow the 02:00 upgrade window to finish.
#   - To check status after deployment: systemctl status apt-daily-upgrade.timer
#   - To view upgrade logs: cat /var/log/unattended-upgrades/unattended-upgrades.log
#
# CHANGE LOG
#   1.0.0  2026-05-21  Initial release
# ===========================================================================

set -euo pipefail

# ---------------------------------------------------------------------------
# CONFIGURATION
# ---------------------------------------------------------------------------
REBOOT_TIME="02:30"          # Time to reboot if a kernel/library update requires it
UPGRADE_HOUR="02"            # Hour the upgrade timer fires (24h)
RANDOM_DELAY="1800"          # Seconds of random spread (1800 = ±30 min)
DRY_RUN=false

# ---------------------------------------------------------------------------
# HELPERS
# ---------------------------------------------------------------------------
log()  { echo "[$(date '+%Y-%m-%d %H:%M:%S')] $*"; }
die()  { echo "[ERROR] $*" >&2; exit 1; }

[[ $EUID -eq 0 ]] || die "This script must be run as root (sudo)."
[[ "${1:-}" == "--dry-run" ]] && DRY_RUN=true

if $DRY_RUN; then
    log "DRY RUN — no changes will be written."
fi

run() {
    if $DRY_RUN; then
        log "WOULD RUN: $*"
    else
        "$@"
    fi
}

# ---------------------------------------------------------------------------
# 1. INSTALL PACKAGES
# ---------------------------------------------------------------------------
log "Installing unattended-upgrades and update-notifier-common..."
run apt-get update -qq
run apt-get install -y unattended-upgrades update-notifier-common

# ---------------------------------------------------------------------------
# 2. CONFIGURE UNATTENDED-UPGRADES
#    /etc/apt/apt.conf.d/50unattended-upgrades
#    Controls WHAT gets upgraded and post-upgrade behavior.
# ---------------------------------------------------------------------------
log "Writing /etc/apt/apt.conf.d/50unattended-upgrades..."
if ! $DRY_RUN; then
cat > /etc/apt/apt.conf.d/50unattended-upgrades << 'EOF'
// Upgrade ALL packages from all origins, not just security.
Unattended-Upgrade::Origins-Pattern {
    "origin=*";
};

// Packages to never auto-upgrade (add regex patterns as needed).
Unattended-Upgrade::Package-Blacklist {
};

// Remove unused kernel packages and dependencies after upgrades.
Unattended-Upgrade::Remove-Unused-Kernel-Packages "true";
Unattended-Upgrade::Remove-New-Unused-Dependencies "true";
Unattended-Upgrade::Remove-Unused-Dependencies "true";

// Reboot automatically if /var/run/reboot-required exists.
Unattended-Upgrade::Automatic-Reboot "true";
Unattended-Upgrade::Automatic-Reboot-WithUsers "true";
Unattended-Upgrade::Automatic-Reboot-Time "02:30";

// Verbose logging.
Unattended-Upgrade::Verbose "false";
Unattended-Upgrade::Debug "false";

// Write to syslog as well.
Unattended-Upgrade::SyslogEnable "true";
Unattended-Upgrade::SyslogFacility "daemon";
EOF
fi

# ---------------------------------------------------------------------------
# 3. CONFIGURE APT PERIODIC
#    /etc/apt/apt.conf.d/20auto-upgrades
#    Controls HOW OFTEN the apt daily timers act.
# ---------------------------------------------------------------------------
log "Writing /etc/apt/apt.conf.d/20auto-upgrades..."
if ! $DRY_RUN; then
cat > /etc/apt/apt.conf.d/20auto-upgrades << 'EOF'
APT::Periodic::Update-Package-Lists "1";
APT::Periodic::Download-Upgradeable-Packages "1";
APT::Periodic::AutocleanInterval "7";
APT::Periodic::Unattended-Upgrade "1";
EOF
fi

# ---------------------------------------------------------------------------
# 4. OVERRIDE SYSTEMD TIMER TO RUN AT 02:00
#    The default apt-daily-upgrade.timer uses a broad calendar expression.
#    We drop a systemd override to pin it to 02:00 with a random spread so
#    the whole fleet does not hit the mirror at the same instant.
# ---------------------------------------------------------------------------
TIMER_OVERRIDE_DIR="/etc/systemd/system/apt-daily-upgrade.timer.d"
log "Writing systemd timer override to ${TIMER_OVERRIDE_DIR}/override.conf..."

if ! $DRY_RUN; then
    mkdir -p "${TIMER_OVERRIDE_DIR}"
    cat > "${TIMER_OVERRIDE_DIR}/override.conf" << EOF
[Timer]
# Clear the upstream calendar expressions before setting our own.
OnCalendar=
OnBootSec=
OnCalendar=*-*-* ${UPGRADE_HOUR}:00:00
RandomizedDelaySec=${RANDOM_DELAY}
Persistent=true
EOF
fi

# Apply the same override to the apt-daily (list update) timer so it runs
# slightly before the upgrade — 01:00 is a sensible default.
DAILY_OVERRIDE_DIR="/etc/systemd/system/apt-daily.timer.d"
log "Writing systemd timer override to ${DAILY_OVERRIDE_DIR}/override.conf..."
if ! $DRY_RUN; then
    mkdir -p "${DAILY_OVERRIDE_DIR}"
    cat > "${DAILY_OVERRIDE_DIR}/override.conf" << EOF
[Timer]
OnCalendar=
OnBootSec=
OnCalendar=*-*-* 01:00:00
RandomizedDelaySec=${RANDOM_DELAY}
Persistent=true
EOF
fi

# ---------------------------------------------------------------------------
# 5. ENABLE AND RESTART TIMERS
# ---------------------------------------------------------------------------
log "Reloading systemd and enabling timers..."
run systemctl daemon-reload
run systemctl enable apt-daily.timer apt-daily-upgrade.timer
run systemctl restart apt-daily.timer apt-daily-upgrade.timer

# ---------------------------------------------------------------------------
# 6. RUN A FULL UPGRADE NOW (optional — comment out if not desired)
# ---------------------------------------------------------------------------
log "Running a full apt upgrade now..."
run apt-get upgrade -y
run apt-get dist-upgrade -y
run apt-get autoremove -y
run apt-get autoclean -y

# ---------------------------------------------------------------------------
# 7. SUMMARY
# ---------------------------------------------------------------------------
log ""
log "=========================================================="
log " Auto-update setup complete."
log "=========================================================="
log " List update timer  : 01:00 daily  (±30 min spread)"
log " Upgrade timer      : 02:00 daily  (±30 min spread)"
log " Auto-reboot time   : ${REBOOT_TIME} (if reboot required)"
log " Upgrade log        : /var/log/unattended-upgrades/"
log ""
log " Verify with:"
log "   systemctl status apt-daily-upgrade.timer"
log "   systemctl list-timers | grep apt"
log "   cat /var/log/unattended-upgrades/unattended-upgrades.log"
log "=========================================================="
