#!/bin/bash

echo "rw cryptdevice=UUID=$(blkid /dev/sda2 -o value -s UUID):root root=/dev/mapper/root quiet loglevel=0 rd.systemd.show_status=false rd.udev.log_priority=0"
