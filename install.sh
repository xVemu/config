#!/bin/sh

wget -O - -q https://nixos.org/nix/install | sh -s -- --daemon --yes

. /etc/profile

nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update
nix-shell '<home-manager>' -A install

# download home.nix
wget -P .config/home-manager -N https://raw.githubusercontent.com/xVemu/config/refs/heads/master/unix/.config/home-manager/home.nix

home-manager switch

echo $(which fish) | sudo tee -a /etc/shells
sudo chsh -s $(which fish) $USER
echo "RESTART TERMINAL!!!"