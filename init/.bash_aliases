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
alias diff='colordiff'

# navigation
alias dev='cd ${DEV_HOME}'

# grep
alias grepjs='grep -R --include=*.js --exclude-dir=node_modules'

# docker
alias dc='docker-compose'
alias dps='docker ps'
# removes orphaned images
alias drmi='docker rmi $(docker images --filter "dangling=true" -q --no-trunc)'
# removes all images with tag
alias drmi-with-tag='drmi $(docker images | grep $1 | tr -s " " | cut -d " " -f 3)'
# removes all images (nuclear option)
alias drmi-nuke='drmi -f $(docker images -aq)'
# removes volumes
alias drmv='docker rm -fv $(docker ps -aq)'

# python
# use python to start a simple HTTP server with the current directory as the document root, on port 8000
alias simple-http-server="python -m SimpleHTTPServer"

# git
alias gits='git status'
alias git-reset='git reset --hard HEAD'
alias git-use-rebase='git config --bool pull.rebase true'
