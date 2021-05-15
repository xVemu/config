# Path to your oh-my-zsh installation.
export ZSH="/Users/vemu/.oh-my-zsh"

ZSH_THEME="cobalt2"

HIST_STAMPS="dd/mm/yyyy"

plugins=(
colemak
colored-man-pages
command-not-found
# compleat
copydir
copyfile
cp
extract
fancy-ctrl-z
gpg-agent
last-working-dir
safe-paste
git-auto-fetch
screen
sudo
nvm
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

# function to change jdk
jdk() {
        if [ "$(uname)" == "Darwin" ]; then
                version=$1
                export JAVA_HOME=$(/usr/libexec/java_home -v"$version");
                java -version
        elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
                alias jdk="sudo update-alternatives --config java"
        fi
}

alias vim="nvim"
alias vi="nvim"

