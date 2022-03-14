
export ZSH="$HOME/.oh-my-zsh"
export PATH="$HOME/.local/bin:$PATH"

ZSH_THEME="gruvbox"
SOLARIZED_THEME="dark"

zstyle ':omz:update' mode reminder  # just remind me to update when it's time

DISABLE_AUTO_TITLE="true"

plugins=(
	fzf
	git 
	zsh-autosuggestions 
	zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh










alias fm='lf ./'

alias vi=/opt/homebrew/Cellar/neovim/0.6.1/bin/nvim

h() {   print -z $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac --height "50%" | sed -E 's/ *[0-9]*\*? *//' | sed -E 's/\\/\\\\/g')   }

fh() {   print -z $( (fd --type directory . ./) | fzf --tac --height "50%" )  } 

gitreview() {
  nvim -p $(git diff --name-only $1..HEAD | sd "\n" " ") +"tabdo Gvdiff $1"
}








[ -f ~/.fzf.zsh  ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPS="--extended"

export FZF_COMPLETION_TRIGGER='fd --type file '
export FZF_DEFAULT_COMMAND='fd --type file '
export FZF_ALT_C_COMMAND="fd --type directory "

export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

export FZF_COMPLETION_TRIGGER='fi'

export FZF_COMPLETION_OPTS='+c -x'

_fzf_compgen_path() {
  fd --follow --exclude ".git" . "$1"
}

_fzf_compgen_dir() {
  fd --type d --follow --exclude ".git" . "$1"
}









n ()
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
alias fm=n









br () {
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







export EDITOR='nvim'







