#!/bin/bash

LOG_FILE="/var/log/splunk_watchdog.log"
SPLUNK_BIN="/opt/splunk/bin/splunk"

TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

if ! pgrep -f splunkd > /dev/null; then
    echo "$TIMESTAMP [WARNING] Splunk is NOT running. Attempting to start it..." >> "$LOG_FILE"
    $SPLUNK_BIN start >> "$LOG_FILE" 2>&1
    echo "$TIMESTAMP [INFO] Splunk start command issued." >> "$LOG_FILE"
else
    echo "$TIMESTAMP [OK] Splunk is running." >> "$LOG_FILE"
fi