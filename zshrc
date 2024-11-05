# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
  git colored-man-pages
  asdf
)

source $ZSH/oh-my-zsh.sh

# Add timestamp to the right
RPROMPT="%D %D{%L:%M:%S}"

# alias `gs` => `git status`
alias gs="git status"

# alias `dockerc` => `docker-compose`
alias dockerc="docker-compose"

# alias `whatismyip`
alias whatismyip="dig +short myip.opendns.com @resolver1.opendns.com"

# alias `sshkeychain`
alias sshkeychain="keychain $HOME/.ssh/id_rsa && source $HOME/.keychain/$(hostname)-sh"
# load the keychain if exist
[ -f $HOME/.keychain/$(hostname)-sh ] && source $HOME/.keychain/$(hostname)-sh

# alias `du -h --max-depth=0`
alias du0="du -h --max-depth=0"

# nvim alias
alias nv="nvim"

# tmux alias
alias tl="tmux ls"
alias ta="tmux a"

# bundle exec alias
alias be="bundle exec"

# Disable shell exit with Ctrl-d
set -o ignoreeof

export PYTHONSTARTUP=~/.pythonrc

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
