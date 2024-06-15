#!/bin/sh

# Variables for VID and PID
VID="2341"
PID="0042"
DEVICE_NAME="ttyACM0"

# Create udev rule file
RULE_FILE="/etc/udev/rules.d/99-arduino.rules"


# Create the udev rule
echo "SUBSYSTEM==\"tty\", ATTRS{idVendor}==\"$VID\", ATTRS{idProduct}==\"$PID\", SYMLINK+=\"$DEVICE_NAME\"" > $RULE_FILE

# Reload udev rules
udevadm control --reload-rules

# Trigger the new rule
udevadm trigger

echo "udev rule created to map Arduino to /dev/$DEVICE_NAME"