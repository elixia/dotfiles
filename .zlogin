# for golang
export GOPATH=$HOME


# for rbenv
#   To use Homebrew's directories rather than ~/.rbenv add to your profile:
export RBENV_ROOT=/usr/local/var/rbenv

# To enable shims and autocompletion add to your profile:
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

export PATH=$PATH:$HOME/.anyenv/bin:/usr/local/opt/bison/bin:$GOPATH/bin:$RBENV_ROOT
eval "$(anyenv init -)"

function peco-select-history() {
    local tac
    if which tac > /dev/null; then
        tac="tac"
    else
        tac="tail -r"
    fi

    BUFFER=$(\history -n 1 | \
        eval $tac | \
        awk '!a[$0]++' | \
        peco --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle clear-screen
}
zle -N peco-select-history
bindkey '^r' peco-select-history

#履歴ファイルの保存先
export HISTFILE=${HOME}/.zsh_history

# メモリに保存される履歴の件数
export HISTSIZE=5000

# 履歴ファイルに保存される履歴の件数
export SAVEHIST=100000

# 重複を記録しない
setopt hist_ignore_dups

# 開始と終了を記録
setopt EXTENDED_HISTORY

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



# monopos
export env="local"
export APP_ENV="local"
#export EC_ID=0
#export EC_ID=32
#export EC_ID=74
export EC_ID=372
export APP_LANG_DIR=372

# fabric
export CRASHLYTICS_API_TOKEN="6283979b59756c54da3767a17818d9a468480cab"
export CRASHLYTICS_BUILD_SECRET="14f052313dc48514901f388dbdff2cdb5912b2756c323f6baf98fc75b31fc088"

