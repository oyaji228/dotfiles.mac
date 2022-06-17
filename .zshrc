
# 環境変数
## LANGをja_JP.UTF-8に設定
export LANG=ja_jp.UTF-8
## 色の設定
export LSCOLORS=Exfxcxdxbxegedabagacad
## 補完時の色の設定
export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
## ZLS_COLORSとは？
export ZLS_COLORS=$LS_COLORS
## lsコマンド時、自動で色がつく(ls -Gのようなもの？)
export CLICOLOR=true
## 補完候補に色を付ける
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}


# 基本設定
## zsh-completions用の設定(コマンド補完機能)
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  compinit
fi
## set prompt
autoload colors
colors
## auto change directory(cdなしでディレクトリ移動可能にす)
setopt auto_cd
## auto directory pushd that you can get dirs list by cd -[tab]
setopt auto_pushd
## command correct edition before each completion attempt
setopt correct
## compacked complete list display
setopt list_packed
## no beep sound when complete list displayed
setopt nolistbeep
## beep音を消す
setopt no_beep
## alias
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
## コマンド履歴
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups		# ignore duplication command history list
setopt share_history		# share command history data
## Prompt設定
### プロンプトに色を付ける
autoload -U colors; colors
### 一般ユーザ時のプロンプト表示設定
tmp_prompt="%{${fg[cyan]}%}%n@%m% :%c# %{${reset_color}%}"
tmp_prompt2="%{${fg[cyan]}%}%_> %{${reset_color}%}"
tmp_rprompt="%{${fg[green]}%}%D{%Y/%m/%d} %* %{${reset_color}%}"
tmp_sprompt="%{${fg[yellow]}%}%r is correct? [Yes, No, Abort, Edit]:%{${reset_color}%}"
### rootユーザ時のプロンプト表示設定(太字にし、アンダーバーをつける)
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
### SSHログイン時のプロンプト Title (user@hostname)
case "${TERM}" in
kterm*|xterm*|)
  precmd() {
    echo -ne "\033]0;${USER}@${HOST%%.*}\007"
  }
  ;;
esac


# pyenv
## 環境変数
export PATH="/usr/local/sbin:$PATH"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval export PATH="/Users/sunao/.pyenv/shims:${PATH}"
export PYENV_SHELL=zsh

## source '/usr/local/Cellar/pyenv/1.2.18/libexec/../completions/pyenv.zsh'
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


