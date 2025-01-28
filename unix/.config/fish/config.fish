if status is-interactive
    set -g theme_hide_hostname yes
    set -g fish_prompt_pwd_dir_length 0
    alias cat='bat'
    alias ls='exa'
    alias l='exa -l'
    alias vi='nvim'
    alias mv="mv -iv"
    alias cp="cp -riv"
    alias mkdir='mkdir -vp'
    zoxide init fish | source
end
