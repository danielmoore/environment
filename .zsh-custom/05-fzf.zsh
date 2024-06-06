[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if [ -d "$ZSH_CUSTOM/plugins/fzf" ]; then
    export FZF_BASE="$ZSH_CUSTOM/plugins/fzf"
    if (( $+commands[fzf] )); then
        plugins+=(fzf)
    else
        echo "Please install fzf for prettier command history with .$ZSH_CUSTOM/plugins/fzf/install"
    fi
fi