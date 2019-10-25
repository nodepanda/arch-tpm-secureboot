#!/bin/bash

EFISTUB=/usr/lib/systemd/boot/efi/linuxx64.efi.stub
DESTINATION=/boot/kernel.efi
SIGNED=/boot/efi/EFI/boot/bootx64.efi
KERNEL=/boot/vmlinuz-linux
INITRD=/boot/initramfs-linux.img
CMDLINE=/boot/cmdline.txt
OSREL=/etc/os-release

objcopy --add-section .osrel="$OSREL" --change-section-vma .osrel=0x20000 \
	--add-section .cmdline="$CMDLINE" --change-section-vma .cmdline=0x30000 \
	--add-section .linux="$KERNEL" --change-section-vma .linux=0x40000 \
	--add-section .initrd="$INITRD" --change-section-vma .initrd=0x3000000 \
"$EFISTUB" "$DESTINATION"

sbsign --key /boot/DB.key --cert /boot/DB.crt --output "$SIGNED" "$DESTINATION"
