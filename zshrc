

export PATH=$PATH:~/Documents/zig-macos-aarch64-0.10.1  

export EDITOR='nvim'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
_fzf_compgen_path() {   fd --hidden --follow --exclude ".git" . "$1"   }
_fzf_compgen_dir() {   fd --type d --hidden --follow --exclude ".git" . "$1"   }
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'


ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


# prompt line design
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats '%F{5}%b%f '
setopt PROMPT_SUBST
PROMPT='%B%F{blue}%~%f%b ${vcs_info_msg_0_}'
#PROMPT='%F{green}%#%f %B%F{blue}%1~%f%b ${vcs_info_msg_0_}'


eval "$(zoxide init zsh)"
eval "$(fnm env --use-on-cd)"


alias vi=/opt/homebrew/bin/nvim
alias ls='exa'
alias lsa='exa -al'
alias lst='exa -T --git-ignore'
alias g=z
alias gf=zi


gh()        {   print -z $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s | sed -E 's/ *[0-9]*\*? *//' | sed -E 's/\\/\\\\/g')   }
alias gce='/opt/homebrew/bin/gh copilot explain'
alias gcs='/opt/homebrew/bin/gh copilot suggest'


gm ()
{
    # Block nesting of nnn in subshells
    if [ -n $NNNLVL ] && [ "${NNNLVL:-0}" -ge 1 ]; then
        echo "nnn is already running"
        return
    fi

    # The behaviour is set to cd on quit (nnn checks if NNN_TMPFILE is set)
    # To cd on quit only on ^G, either remove the "export" as in:
    #    NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
    #    (or, to a custom path: NNN_TMPFILE=/tmp/.lastd)
    # or, export NNN_TMPFILE after nnn invocation
    export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"

    # Unmask ^Q (, ^V etc.) (if required, see `stty -a`) to Quit nnn
    # stty start undef
    # stty stop undef
    # stty lwrap undef
    # stty lnext undef

    nnn "$@"

    if [ -f "$NNN_TMPFILE" ]; then
            . "$NNN_TMPFILE"
            rm -f "$NNN_TMPFILE" > /dev/null
    fi
}


gn () {
    local cmd cmd_file code
    cmd_file=$(mktemp)
    if broot --outcmd "$cmd_file" "$@"; then
        cmd=$(<"$cmd_file")
        rm -f "$cmd_file"
        eval "$cmd"
    else
        code=$?
        rm -f "$cmd_file"
        return "$code"
    fi
}














