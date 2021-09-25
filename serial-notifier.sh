#Serial notification script. Displays a toast upon the connection of a serial device.
systemctl --user import-environment DISPLAY

CHOICE=$(dunstify --action="default,Do nothing" --action="forwardAction,Open Terminal @ 115200b 8-bit" "Serial device connected on /dev/$1" --icon="network-transmit-receive" --timeout=5 )

if [[ "$CHOICE" == forwardAction ]]; then
	gnome-terminal -- tio --baudrate 115200 "/dev/$1"
fi
