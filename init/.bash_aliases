# sh
alias init='. ~/.bashrc'
alias ls='ls -GH'
alias ll='ls -la'

# navigation
alias dev='cd ${DEV_HOME}'

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
