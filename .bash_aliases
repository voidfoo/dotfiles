alias scr='screen -dRR'
alias cls='printf "\033c"'

alias ll='ls -alF --color'
alias l='ls -aF --color'

alias m='less'

alias envgrep='printenv | grep --color'
alias psgrep='ps -aux | grep -v "grep --color" | grep --color'
alias hgrep='history | grep --color'

alias em='emacsclient -t'
alias emd='emacs --daemon'

alias h='history'

alias ta='tmux attach'
alias td='tmux detach'

alias mgt='emacsclient -nw -e "(magit-status)"'

# I don't want to maintain another rc file for bash so put everything here.
PS1='\[\e[0;32m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[1;32m\]\$\[\e[m\] \[\e[1;37m\]'
