#!/bin/bash

echo "Cryptdevice?"
read CRYPTDEVICE
CMDLINE="rw cryptdevice=UUID=$(blkid $CRYPTDEVICE -o value -s UUID):root root=/dev/mapper/root quiet loglevel=0 rd.systemd.show_status=false rd.udev.log_priority=0"
echo "Generating CMDLINE:"
echo $CMDLINE
echo $CMDLINE > /boot/cmdline.txt
