#!/bin/bash
sudo apt-get remove -y --purge libreoffice-common unity-webapps-common thunderbird imagemagick transmission-gtk remmina cheese rhythmbox shotwell
sudo add-apt-repository -y ppa:neovim-ppa/unstable
sudo apt update
sudo apt install -y git zsh neovim fonts-powerline ranger curl
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
chsh -s $(which zsh)
export ZSH="$HOME/.oh-my-zsh"
cat <<EOT > .zshrc
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="cobalt2"

HIST_STAMPS="dd/mm/yyyy"

plugins=(
colored-man-pages
command-not-found
copydir
copyfile
cp
extract
fancy-ctrl-z
last-working-dir
safe-paste
sudo
zsh-syntax-highlighting
zsh-autosuggestions
)

source $HOME/.oh-my-zsh/oh-my-zsh.sh

# Custom ZSH Binds
bindkey '^ ' autosuggest-accept

# NOT SHOWING NAME AND COMPUTERNAME
prompt_context() {}

alias vim="nvim"
alias vi="nvim"
EOT
mkdir ~/.config/nvim/
cat <<EOT > .config/nvim/init.vim
call plug#begin('~/.config/nvim/bundle')

Plug 'altercation/vim-colors-solarized'
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdcommenter'
call plug#end()

set noshowmode
set termguicolors
let g:solarized_termcolors=256
syntax enable
set background=dark
colorscheme solarized
let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ }
set autoindent
set smarttab
set mouse=a
set number relativenumber
filetype plugin on
EOT
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
curl -o ${ZSH:-~/.oh-my-zsh}/themes/cobalt2.zsh-theme --create-dirs https://raw.githubusercontent.com/cezarywojcik/dotfiles/master/.oh-my-zsh/themes/cobalt2.zsh-theme
curl -o ${XDG_DATA_HOME:-$HOME/.local/share}/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim -c 'PlugInstall' -c 'qa!'
curl -o cobalt2.dconf https://raw.githubusercontent.com/bhaveshgohel/cobalt2-ubuntu-profile/master/profile.dconf
conf=$(dconf dump /org/gnome/terminal/legacy/profiles:/ | grep -e "\[\:.*\]")
conf=${conf:2:-1}
dconf load /org/gnome/terminal/legacy/profiles:/:$conf/ < cobalt2.dconf
rm cobalt2.dconf
gnome-session-quit --force
