# sh
alias init='. ~/.bashrc'
alias ls='ls -GH'
alias ll='ls -la'
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'
alias h='history'
alias vi='vim'

# navigation
alias dev='cd ${DEV_HOME}'

# grep
alias grepjs='grep -R --include=*.js --exclude-dir=node_modules'

# docker
alias dc='docker-compose'
alias dps='docker ps'
# removes orphaned images
alias drmi='docker rmi $(docker images --filter "dangling=true" -q --no-trunc)'
# removes volumes
alias drmv='docker rm -fv $(docker ps -aq)'

# git
alias gits='git status'
alias git-reset='git reset --hard HEAD'
alias git-use-rebase='git config --bool pull.rebase true'
