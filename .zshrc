# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="mortalscumbag"
# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git brew catimg virtualenv virtualenvwrapper boot2docker zsh-syntax-highlighting safe-paste knife vagrant ant sublime systemadmin git-extra rails ruby composer django  python)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
PATH=$PATH:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:$HOME/bin:/opt/cbd

### Added by the Heroku Toolbelt
PATH="/usr/local/heroku/bin:$PATH"
###unset auto complete
unsetopt correct_all
export EDITOR='vim'
export XDEBUG_CONFIG="idekey=phpStorm"
export ANDROID_HOME='~/Library/Android/sdk/tools'
RPROMPT='%{$fg[green]%}$(virtualenv_prompt_info)%{$reset_color%}%'
export GOPATH=$HOME/gohome
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
PATH=$PATH:$HOME/.gem/ruby/2.2.0/bin
PATH=$PATH:$HOME/gohome/bin
export PATH

#set LANG for Ruby.
export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
