# 補完機能
autoload -Uz compinit
compinit

# set prompt
#
autoload colors
colors

#
# set prompt
#
#case ${UID} in
#0)
#    PROMPT="%{${fg[red]}%}%/#%{${reset_color}%} "
#    PROMPT="%{${fg[cyan]}%}$(echo ${HOST%%.*} | sed -e 's@^@%!->@' ) ${PROMPT}"
#
#    PROMPT2="%B%{${fg[red]}%}%_#%{${reset_color}%}%b "
#    RPROMPT="%T"
#    SPROMPT="%B%{${fg[red]}%}%r is correct? [n,y,a,e]:%{${reset_color}%}%b "
#    ;;
#*)
#    PROMPT="%!->%m[%~] "
#    RPROMPT="%T"
#    PROMPT2="%{${fg[red]}%}%_%%%{${reset_color}%} "
#i    SPROMPT="%{${fg[red]}%}%r is correct? [n,y,a,e]:%{${reset_color}%} "
#    ;;
#esac


#
# auto change directory
# cdなしでディレクトリ移動可能にする
setopt auto_cd
#
# auto directory pushd that you can get dirs list by cd -[tab]
#
setopt auto_pushd

# command correct edition before each completion attempt
##
setopt correct

# compacked complete list display
#
setopt list_packed

# no beep sound when complete list displayed
#
setopt nolistbeep

# beep音を消す
setopt no_beep


# alias
alias ll="ls -l"
alias la="ls -a"
alias ls="ls -G -w"
alias lf="ls -F"
alias su="su -l"
alias rm="rm -i"
alias h="history"
alias trace="traceroute"
alias tel="telnet"
alias q="exit"
alias vi="vim"
alias cls="clear"


# 環境変数
## LANGをja_JP.UTF-8に設定
export LANG=ja_jp.UTF-8
# 色の設定
export LSCOLORS=Exfxcxdxbxegedabagacad
# 補完時の色の設定
export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
# ZLS_COLORSとは？
export ZLS_COLORS=$LS_COLORS
# lsコマンド時、自動で色がつく(ls -Gのようなもの？)
export CLICOLOR=true
# 補完候補に色を付ける
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}


## Default shell configuration
#
# set prompt
#
#PROMPT="%/%% "
#PROMPT2="%_%% "
#RPROMPT="%T"
#SPROMPT="%r is correct? [n,y,a,e]: "
#
## set prompt color
#case ${HOSTNAME} in
#    r*)
#        local HOSTCOLOR=$'\e[30;48;5;183m'
#        ;;
#    N*)
#        local HOSTCOLOR=$'\e[36;48;5;081m'
#        ;;
#esac
#
#local COLOR_FG=$'\e[38;5;034m'
#local COLOR_BG=$'\e[30;48;5;082m'
#local COLOR_RESET=$'\e[0m'
## PROMPT="${COLOR_FG}[%h:%n@${COLOR_RESET}${HOSTCOLOR}%m${COLOR_RESET}${COLOR_FG}:%c]>${COLOR_RESET}"
#PROMPT="%{${COLOR_FG}%}[%h:%n@%{${COLOR_RESET}%}%{${HOSTCOLOR}%}%m%{${COLOR_RESET}%}%{${COLOR_FG}%}:%c]>%{${COLOR_RESET}%}"
#

### Prompt ###
# プロンプトに色を付ける
autoload -U colors; colors
# 一般ユーザ時
tmp_prompt="%{${fg[cyan]}%}%n@%m% :%c# %{${reset_color}%}"
tmp_prompt2="%{${fg[cyan]}%}%_> %{${reset_color}%}"
tmp_rprompt="%{${fg[green]}%}%D{%Y/%m/%d} %* %{${reset_color}%}"
tmp_sprompt="%{${fg[yellow]}%}%r is correct? [Yes, No, Abort, Edit]:%{${reset_color}%}"

# rootユーザ時(太字にし、アンダーバーをつける)
if [ ${UID} -eq 0 ]; then
  tmp_prompt="%B%U${tmp_prompt}%u%b"
  tmp_prompt2="%B%U${tmp_prompt2}%u%b"
  tmp_rprompt="%B%U${tmp_rprompt}%u%b"
  tmp_sprompt="%B%U${tmp_sprompt}%u%b"
fi

PROMPT=$tmp_prompt    # 通常のプロンプト
PROMPT2=$tmp_prompt2  # セカンダリのプロンプト(コマンドが2行以上の時に表示される)
RPROMPT=$tmp_rprompt  # 右側のプロンプト
SPROMPT=$tmp_sprompt  # スペル訂正用プロンプト
# SSHログイン時のプロンプト
#[ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
#  PROMPT="%{${fg[white]}%}${HOST%%.*} ${PROMPT}"
#;

#RPROMPT="%{$fg[green]%} %D{%Y/%m/%d} %* %{$reset_color%}"

### Title (user@hostname) ###
case "${TERM}" in
kterm*|xterm*|)
  precmd() {
    echo -ne "\033]0;${USER}@${HOST%%.*}\007"
  }
  ;;
esac




# コマンド履歴
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups		# ignore duplication command history list
setopt share_history		# share command history data


export PATH="/usr/local/sbin:$PATH"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval export PATH="/Users/sunao/.pyenv/shims:${PATH}"
export PYENV_SHELL=zsh

#source '/usr/local/Cellar/pyenv/1.2.18/libexec/../completions/pyenv.zsh'
command pyenv rehash 2>/dev/null
pyenv() {
  local command
  command="${1:-}"
  if [ "$#" -gt 0 ]; then
    shift
  fi

  case "$command" in
  rehash|shell)
    eval "$(pyenv "sh-$command" "$@")";;
  *)
    command pyenv "$command" "$@";;
  esac
}



# powerline
function powerline_precmd() {
    PS1="$(powerline-shell --shell zsh $?)"
}

function install_powerline_precmd() {
  for s in "${precmd_functions[@]}"; do
    if [ "$s" = "powerline_precmd" ]; then
      return
    fi
  done
  precmd_functions+=(powerline_precmd)
}

if [ "$TERM" != "linux" ]; then
    install_powerline_precmd
fi


