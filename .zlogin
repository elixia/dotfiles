# for golang
export GOPATH=$HOME

# for nodebrew
#   To use Homebrew's directories rather than ~/.nodebrew add to your profile:
export NODEBREW_ROOT=/usr/local/var/nodebrew

# for rbenv
#   To use Homebrew's directories rather than ~/.rbenv add to your profile:
export RBENV_ROOT=/usr/local/var/rbenv

# To enable shims and autocompletion add to your profile:
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

export PATH=$PATH:$GOPATH/bin:$NODEBREW_ROOT/current/bin:$RBENV_ROOT


function peco-select-history() {
    local tac
    if which tac > /dev/null; then
        tac="tac"
    else
        tac="tail -r"
    fi
    BUFFER=$(\history -n 1 | \
        eval $tac | \
        peco --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle clear-screen
}
zle -N peco-select-history
bindkey '^r' peco-select-history

function peco-src () {
  local selected_dir=$(ghq list -p | peco --query "$LBUFFER")
  if [ -n "$selected_dir" ]; then
    BUFFER="cd ${selected_dir}"
    zle accept-line
  fi
  zle clear-screen
}
zle -N peco-src
bindkey '^]' peco-src

# workaround for
# https://github.com/robbyrussell/oh-my-zsh/issues/4341

export LC_ALL="en_US.UTF-8"

