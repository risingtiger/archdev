
alias python=/usr/local/Cellar/python@3.9/3.9.0_1/bin/python3.9
alias pip=/usr/local/bin/pip3
alias fm='lf ./'
alias vi=/usr/local/bin/nvim
h() {   print -z $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac --height "50%" | sed -E 's/ *[0-9]*\*? *//' | sed -E 's/\\/\\\\/g')   }
fh() {   print -z $( (fd --type directory . ~/) | fzf --tac --height "50%" )  } 

gitreview() {
  nvim -p $(git diff --name-only $1..HEAD | sd "\n" " ") +"tabdo Gvdiff $1"
}






ZSH_THEME="gruvbox"
SOLARIZED_THEME="dark"

export ZSH="/Users/xenition/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
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








# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/xenition/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/xenition/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/xenition/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/xenition/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
