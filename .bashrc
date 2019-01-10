
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

[[ -e ~/.phpbrew/bashrc ]] && source ~/.phpbrew/bashrc

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

###-tns-completion-start-###
if [ -f /Users/phantasweng/.tnsrc ]; then 
    source /Users/phantasweng/.tnsrc 
fi
###-tns-completion-end-###
