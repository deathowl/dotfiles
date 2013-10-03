# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="owl"
# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git osx knife vagrant ant macports git-extra rails ruby composer django  python)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
PATH=/opt/local/bin:/opt/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:$HOME/bin
export USTREAM_DEVELOPER_MODE=TRUE

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
###unset auto complete
unsetopt correct_all
export EDITOR='vim'
export XDEBUG_CONFIG="idekey=phpStorm"

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
PATH=$PATH:/opt/local/share/java/android-sdk-macosx/tools #add Android SDK to path for scripting
PATH=$PATH:/opt/local/share/java/android-sdk-macosx/platform-tools #add Android platform tools to path for scripting
