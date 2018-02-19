# Path to your oh-my-zsh configuration.
export LANG="en_US.UTF-8" 
ZSH=/usr/share/oh-my-zsh
ZSH_CUSTOM=$HOME/.oh-my-zsh/custom
# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
export TERM="xterm-256color"
ZSH_THEME="awesomepanda"
# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git brew screen catimg  zsh-syntax-highlighting safe-paste sublime systemadmin git-extra rails ruby composer django sudo docker virtualenvwrapper)
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context docker_machine  dir vcs virtualenv)
POWERLEVEL9K_SHOW_CHANGESET=true
POWERLEVEL9K_HIDE_BRANCH_ICON=true
source $ZSH/oh-my-zsh.sh
source $HOME/bin/z.sh
# Customize to your needs...
PATH=$PATH:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:$HOME/bin:/opt/cbd

### Added by the Heroku Toolbelt
PATH="/usr/local/heroku/bin:$PATH"
###unset auto complete
unsetopt correct_all
export EDITOR='vim'
export XDEBUG_CONFIG="idekey=phpStorm"
export ANDROID_HOME='~/Library/Android/sdk/tools'
export GOPATH=$HOME/gohome
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
PATH=$PATH:$HOME/.gem/ruby/2.2.0/bin
PATH=$PATH:$HOME/gohome/bin
export PATH

#set LANG for Ruby.
export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export ANDROID_SDK_ROOT=/usr/local/opt/android-sdk
