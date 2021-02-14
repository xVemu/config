# Path to your oh-my-zsh installation.
export ZSH="/Users/vemu/.oh-my-zsh"

ZSH_THEME="cobalt2"

HIST_STAMPS="dd/mm/yyyy"

plugins=(
colemak
colored-man-pages
command-not-found
compleat
copydir
copyfile
cp
extract
fancy-ctrl-z
gpg-agent
last-working-dir
safe-paste
vi-mode
git-auto-fetch
screen
sudo
zsh-syntax-highlighting
zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# Custom ZSH Binds
bindkey '^ ' autosuggest-accept

# NOT SHOWING NAME AND COMPUTERNAME
prompt_context() {}
# ALIASES
alias gp="git pull"
alias code="code-insiders"

# NODE VERSION MANAGER
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# function to change jdk
jdk() {
        version=$1
        export JAVA_HOME=$(/usr/libexec/java_home -v"$version");
        java -version
}

# vi mode
bindkey -v
