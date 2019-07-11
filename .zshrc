# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/phantasweng/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="robbyrussell"
# ZSH_THEME="powerlevel9k/powerlevel9k"
ZSH_THEME="powerline"

# THEME CONFIG
POWERLINE_HIDE_HOST_NAME="true"
POWERLINE_PATH="short"
POWERLINE_DETECT_SSH="true"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  git-open
  zsh-completions
  zsh-autosuggestions
  # zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
export EDITOR='vim'

# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
alias finder="open -a Finder ./"
alias subl="'/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl'"
alias macdown="'/Applications/MacDown.app/Contents/SharedSupport/bin/macdown'"
alias aws='ssh ubuntu@13.115.142.18'

alias grep="grep --color=auto"

function vueInit() {
  touch .env.development
  touch .env.production
  touch vue.config.js
}

function updateI18n() {
  curl https://static.owlting.com/booking/lang/v$1/zh_TW.json > ~/Code/owlnest/owlnest_booking_site_v2/lang/zh_TW.json;
  curl https://static.owlting.com/booking/lang/v$1/en.json > ~/Code/owlnest/owlnest_booking_site_v2/lang/en.json;
  curl https://static.owlting.com/booking/lang/v$1/ja.json > ~/Code/owlnest/owlnest_booking_site_v2/lang/ja.json;
}

#port {port}
function port() {sudo lsof -i :$1}

#kill-port {PID}
function kill-port() {sudo kill -9 $1}


# Docker
function docker-up() {cd ~/Dockers/$1_dockerfiles; docker-compose stop; docker-compose up -d mariadb nginx redis php-fpm workspace; cd -;}
function docker-stop() {cd ~/Dockers/$1_dockerfiles; docker-compose stop; cd -;}
function docker-ssh() {cd ~/Dockers/$1_dockerfiles; docker-compose exec workspace bash; cd -;}
function docker-stopall() {docker stop $(docker ps -a -q); cd -;}

alias ota="cd ~/Code/owlota/owlota-frontend"
alias pms="cd ~/Code/owlnest/owlnest_booking_site_v2/BE/admin"
alias be="cd ~/Code/owlnest/owlnest_booking_engine"
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

POWERLINE_PATH="short"

#Tmux setting
zstyle ':omz:module:tmux' auto-start 'yes'

# Auto Start
if [[ -z "$TMUX" ]] && zstyle -t ':omz:module:tmux' auto-start; then
  tmux_session="Phantas"
  if ! tmux has-session -t "$tmux_session" 2> /dev/null; then
    # Disable the destruction of unattached sessions globally.
    tmux set-option -g destroy-unattached off &> /dev/null
    # Create a new session.
    tmux new-session -d -s "$tmux_session"
    # Disable the destruction of the new, unattached session.
    tmux set-option -t "$tmux_session" destroy-unattached off &> /dev/null
    # Enable the destruction of unattached sessions globally to prevent
    # an abundance of open, detached sessions.
    tmux set-option -g destroy-unatta
  fi
  exec tmux attach-session -t "$tmux_session"
fi

if [[ -e $HOME/.motd ]]; then cat $HOME/.motd; fi


###-tns-completion-start-###
if [ -f /Users/phantasweng/.tnsrc ]; then
    source /Users/phantasweng/.tnsrc
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
###-tns-completion-end-###

###-tns-completion-start-###
if [ -f /Users/phantasweng/.tnsrc ]; then
    source /Users/phantasweng/.tnsrc
fi
###-tns-completion-end-###

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
source /Users/phantasweng/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

