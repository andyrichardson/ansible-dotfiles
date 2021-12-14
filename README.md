# Install OS

See [INSTALL.md](./INSTALL.md)

## System installation

> Run in chroot or booted system as root

Install deps

```sh
su root
pacman -Syy git ansible
```

Clone repo

```sh
git clone git://github.com/andyrichardson/ansible-dotfiles /tmp/ansible
cd /tmp/ansible
```

Install base system deps

```sh
ansible-playbook init.yml
```

Set password for users before reboot

```sh
# Root password
passwd

# User password
su someuser
passwd
```

## Applications + dotfiles

> Run as user

```sh
ansible-galaxy install -r requirements.yml
```

```sh
ansible-playbook setup.yml
```