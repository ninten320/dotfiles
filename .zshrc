# 日本語・UTF-8に設定
export LANG=ja_JP.UTF-8
# エディタをVimに
export EDITOR=vim
# キーバインドはEmacs
bindkey -e

# エイリアス
alias rm='rmtrash'
alias ls='ls -hpACGT'
alias ll='ls -l'
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'

# 色を使用
autoload -Uz colors && colors
export LSCOLORS=gxfxcxdxbxegedabagacad
export LS_COLORS='di=36:ln=35:so=32:pi=33:ex=31:bd=36;01:cd=33;01:su=31;40;07:sg=36;40;07:tw=32;40;07:ow=33;40;07:'

# プロンプト
#PROMPT="%F{red}[%f%~%F{red}]%f
#%F{yellow}%D{%Y/%m/%d %T}%f %F{cyan}>%f "
#PROMPT2="                    %F{cyan}…%f "
PROMPT="%F{yellow}%D{%Y/%m/%d %T}%f %F{red}[%f%~%F{red}]%f
%F{blue}>%f "
PROMPT2="%F{blue}…%f "
SPROMPT="zsh: correct %F{red}'%R'%f -> %F{green}'%r'%f [y/n/a/p]? "

# gitの情報を表示
autoload -Uz vcs_info
autoload -Uz add-zsh-hook
setopt PROMPT_SUBST

zstyle ':vcs_info:*' formats '%F{green}[%b]%f'
zstyle ':vcs_info:*' actionformats '%F{red}[%b|%a]%f'

function _update_vcs_info_msg() {
  LANG=en_US.UTF-8 vcs_info
  RPROMPT="${vcs_info_msg_0_}"
}
add-zsh-hook precmd _update_vcs_info_msg

# 補完を有効にする
autoload -Uz compinit && compinit

zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# ヒストリの設定
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
# 同時に起動したzsh間でヒストリを共有
setopt share_history
# ヒストリーに重複を表示しない
setopt histignorealldups
# ヒストリーを展開
setopt histexpand

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
if [ -d "${PYENV_ROOT}" ]; then
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"
fi

# nodebrew
export PATH=$HOME/.nodebrew/current/bin:$PATH

# brew doctorのwarning対策
alias brew="env PATH=${PATH/\/Users\/${USER}\/\.pyenv\/shims:/} brew"

