# NixOs neon

## Partitions

```sh
DISK=/dev/disk/by-id/ata-VBOX_HARDDISK_VBf3bca3fc-20a6ea2d
parted -s ${DISK} -- mklabel gpt
parted -s ${DISK} -- mkpart primary 512MiB -8GiB
parted -s ${DISK} -- mkpart primary linux-swap -8GiB 100%
parted -s ${DISK} -- mkpart ESP fat32 1MiB 512MiB
parted -s ${DISK} -- set 3 esp on
```

## ZFS

```sh
zpool create -O mountpoint=none -O atime=off -O acltype=posixacl -O encryption=aes-256-gcm -O keyformat=passphrase rpool $DISK-part1
zfs create -o mountpoint=legacy rpool/root
zfs create -o mountpoint=legacy rpool/nix
zfs create -o mountpoint=legacy rpool/home
```

## Mount

```sh
mount -t zfs rpool/root /mnt
mkdir /mnt/home
mount -t zfs rpool/home /mnt/home
mkdir /mnt/nix
mount -t zfs rpool/nix /mnt/nix
mkfs.vfat $DISK-part3
mkdir /mnt/boot
mount $DISK-part3 /mnt/boot
```

## NixOs

```sh
nixos-generate-config --root /mnt
```

Edit /mnt/etc/nixos/configuration.nix and add the following line:

```nix
  boot.supportedFilesystems = [ "zfs" ];
```

Also, make sure you set the networking.hostId option, which ZFS requires:

Generate a random 8-digit hex string:

```sh
openssl rand -hex 4
```

```nix
  networking.hostId = "<random 8-digit hex string>";
```

Complete editing of `/mnt/etc/nixos/configuration.nix`

Continue with installation!

```sh
nixos-install
```
