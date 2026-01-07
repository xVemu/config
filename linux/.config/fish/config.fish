if status is-interactive
    alias cat bat
    alias cp 'cp -riv'
    alias l 'eza -l'
    alias la 'eza -a'
    alias ll 'eza -l'
    alias lla 'eza -la'
    alias ls eza
    alias lt 'eza --tree'
    alias mkdir 'mkdir -vp'
    alias mv 'mv -iv'

    zoxide init fish | source
    vfox activate fish | source

    set -g theme_hide_hostname yes
    set -g fish_prompt_pwd_dir_length 0
end
