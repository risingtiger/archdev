

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
alias ls='eza'
alias lsa='eza -al'
alias lst='eza -T --git-ignore'
alias g=z
alias gf=zi
alias gj="python -m aider --vim"


gh()        {   print -z $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s | sed -E 's/ *[0-9]*\*? *//' | sed -E 's/\\/\\\\/g')   }
alias gce='/opt/homebrew/bin/gh copilot explain'
alias gcs='/opt/homebrew/bin/gh copilot suggest'

export NNN_PLUG='p:preview-tui'

GF ()
{
    if [ -n $NNNLVL ] && [ "${NNNLVL:-0}" -ge 1 ]; then
        echo "nnn is already running"
        return
    fi

    export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"

    nnn "$@"

    if [ -f "$NNN_TMPFILE" ]; then
            . "$NNN_TMPFILE"
            rm -f "$NNN_TMPFILE" > /dev/null
    fi
}


findancestoryfile () {
  if [ -f "$1" ]; then
    printf '%s\n' "${PWD%/}/$1"
  elif [ "$PWD" = / ]; then
    false
  else
    # a subshell so that we don't affect the caller's $PWD
    (cd .. && findancestoryfile "$1")
  fi
}




source /Users/dave/.config/broot/launcher/bash/br

alias GFF=br


