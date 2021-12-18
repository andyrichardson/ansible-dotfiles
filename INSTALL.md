# Install

Steps for arch install

## Mounting filesystems

> Assuming filesystem is already partitioned.

Mount system

```sh
cryptsetup open /dev/<part> cryptroot
mount /dev/mapper/cryptroot /mnt
```

Mount `esp`/`efi` in `/boot`

```sh
mount /dev/<part> /mnt/boot
```

Mount swap (if using genfstab)

```sh
swapon /dev/swap_partition
```

## Installation

Install OS

```sh
pacstrap /mnt base linux linux-firmware lvm2
```

Rebuild fstab

```sh
genfstab -U /mnt > /mnt/etc/fstab
```

Chroot

> Note: all following commands are expected to be run inside chroot

```sh
arch-chroot /mnt
```

Rebuild initramfs (first make sure following hooks are present in `/etc/mkinitcpio.conf)

```
HOOKS=(base systemd autodetect keyboard sd-vconsole modconf block sd-encrypt lvm2 filesystems fsck)
```

Create sd-vconsole config

```
touch /etc/vconsole.conf
```

```sh
mkinitcpio -P
```

Install systemd-boot

```sh
bootctl install
```

Add boot config to `/boot/loader/entries/arch.conf`

```
title    Arch
linux    /vmlinuz-linux
initrd   /initramfs-linux.img
options  rd.luks.name=<uuid>=cryptroot root=/dev/mapper/cryptroot rw
```

> Use `cryptsetup luksUUID /dev/<device> >> /.../arch.conf` to get uuid

## Additional (optional)

#### Intel microcode

Add intel microcode to `/boot/loader/entries/arch.conf` (if using systemd-boot)

```
title    Arch
linux    /vmlinuz-linux
initrd   /intel-ucode.img
initrd   /initramfs-linux.img
...
```

#### Intel hardware video accel

Install `intel-media-driver`

#### Intel vulkan support

Install `vulkan-intel`
