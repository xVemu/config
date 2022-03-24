# Path to your oh-my-zsh installation.
export ZSH="/Users/vemu/.oh-my-zsh"

ZSH_THEME="cobalt2"

HIST_STAMPS="dd/mm/yyyy"

plugins=(
colemak
colored-man-pages
command-not-found
# compleat
copypath
copyfile
cp
docker
docker-compose
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
alias ls=exa
alias cat='bat --paging=never'
alias vim="nvim"
alias vi="nvim"

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

export NVM_SYMLINK_CURRENT=true
ls -ld $NVM_DIR/current
