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
autoload -Uz colors
colors
export LSCOLORS=exfxcxdxbxegedabagacad
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=36;01:cd=33;01:su=31;40;07:sg=36;40;07:tw=32;40;07:ow=33;40;07:'

# プロンプト
PROMPT="%F{yellow}%D{%Y/%m/%d %T}%f %F{blue}[%m]%#%f
%F{red}[%f%~%F{red}]%f %F{cyan}>%f "
PROMPT2="%F{red}[%f%~%F{red}]%f %F{cyan}…%f "
SPROMPT="zsh: correct %F{red}'%R'%f -> %F{green}'%r'%f [y/n/a/p]? "

# gitの情報を表示
autoload -Uz vcs_info
autoload -Uz add-zsh-hook
setopt PROMPT_SUBST    # プロンプト表示ごとに変数を展開する

zstyle ':vcs_info:*' formats '%F{green}[%b]%f'
zstyle ':vcs_info:*' actionformats '%F{red}[%b|%a]%f'

function _update_vcs_info_msg() {
  LANG=en_US.UTF-8 vcs_info
  RPROMPT="${vcs_info_msg_0_}"
}
add-zsh-hook precmd _update_vcs_info_msg

# 間違ったコマンドを入力したときにもしかしてを表示
setopt correctall
# ビープ音を鳴らさない
setopt nobeep
# cdがなくても移動
setopt autocd
# Ctrl+Dで終了しない
setopt ignore_eof

# 自動でpushdを実行
setopt autopushd
setopt pushdignoredups

# 補完を有効にする
autoload -Uz compinit
compinit

#補完候補を詰めて表示
setopt listpacked

#入力途中の履歴補完を有効化する
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end

#入力途中の履歴補完
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

# 同時に起動したzsh間でヒストリを共有
setopt share_history
# ヒストリの設定
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
# ヒストリーに重複を表示しない
setopt histignorealldups
# ヒストリーを展開
setopt histexpand

# 語の途中でもカーソル位置で補完
setopt complete_in_word
# ファイル名一覧を順次表示
setopt alwayslastprompt
# ドット指定しなくてもマッチ
setopt globdots

# 展開する前に補完候補を出させる(Ctrl-iで補完するようにする)
bindkey "^I" menu-complete

# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
# 矢印キーで選択可能
zstyle ':completion:*:default' menu select=1
# ファイル補完候補に色を付ける
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# オブジェクトファイルとか中間ファイルとかはfileとして補完させない
zstyle ':completion:*:*files' ignored-patterns '*?.o' '*?~' '*\#'

# 補完を設定
zstyle ':completion:*' verbose yes
zstyle ':completion:*' completer _expand _complete _match _prefix _approximate _list _history
zstyle ':completion:*:messages' format '%F{green}%d%f'
zstyle ':completion:*:warnings' format '%F{red}No matches for:%f%F{green} %d %f'
zstyle ':completion:*:descriptions' format '%F{green}completing %B%d%b%f'
zstyle ':completion:*:corrections' format '%F{green}%B%d %f%F{red}(errors: %e)%b%f'
zstyle ':completion:*:options' description 'yes'

