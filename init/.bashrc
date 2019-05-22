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

# custom, "extended" init
if [ -f ~/.bashrc_ext ]; then
    . ~/.bashrc_ext
fi

# git
# auto-completion: see https://git-scm.com/book/en/v1/Git-Basics-Tips-and-Tricks
if [ -f ${SCRIPTS_HOME}/git/git-completion.bash ]; then
	. ${SCRIPTS_HOME}/git/git-completion.bash
fi

# nvm
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion

# print the date/time
echo ''
echo `date '+%A, %B %d, %Y, %H:%M:%S'`
echo ''

# a fun message
echo `fortune`
echo ''
echo 'Have a nice day!'
echo ''
