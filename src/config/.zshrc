
alias fm='lf ./'
alias vi=/usr/bin/nvim
h() {   print -z $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac --height "50%" | sed -E 's/ *[0-9]*\*? *//' | sed -E 's/\\/\\\\/g')   }
fh() {   print -z $( (fd --type directory . ~/) | fzf --tac --height "50%" )  } 

gitreview() {
  nvim -p $(git diff --name-only $1..HEAD | sd "\n" " ") +"tabdo Gvdiff $1"
}






ZSH_THEME="gruvbox"
SOLARIZED_THEME="dark"

export ZSH="/root/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

plugins=(
  fzf
  git
  colored-man-pages
  zsh-syntax-highlighting
  zsh-autosuggestions
  zsh-z
)

source $ZSH/oh-my-zsh.sh

if [[ -n $SSH_CONNECTION ]]; then
 export EDITOR='nvim'
else
 export EDITOR='nvim'
fi









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








