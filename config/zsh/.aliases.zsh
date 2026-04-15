### aliases ###
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
(( ${+commands[trash]} )) && alias rm='trash'

### fvm ###
alias flutter='fvm flutter'
alias dart='fvm dart'

### bat ###
alias less='bat'
# pagingを無効
alias cat='bat --paging=never'

### lsd ###
# ファイル→ディレクトの順でほぼ全て表示（.と..は除く）
alias ls='lsd -A --group-dirs=last'
# サイズが人に優しいリスト表示で、ディレクトリのサイズは中のファイルの合計を表示
alias ll='lsd -Ahl --total-size --group-dirs=last'
# ツリー表示
alias tree='lsd -A --tree --group-dirs=last'
# ツリー形式でファイル情報も表示
alias lr='lsd -Ahl --total-size --tree --group-dirs=last'
