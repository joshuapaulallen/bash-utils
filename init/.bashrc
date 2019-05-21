# prompt
PS1="\u:\w\$ "

# aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# env
if [ -f ~/.env ]; then
    . ~/.env
fi

# nvm
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion

# a fun message
echo `fortune`
echo ''
echo 'Have a nice day!'
echo ''
