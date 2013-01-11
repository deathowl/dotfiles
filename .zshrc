# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="clean"
# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git osx terminalapp macports git-extra)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
PATH=/opt/local/bin:/opt/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:$HOME/bin
export USTREAM_DEVELOPER_MODE=TRUE

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
###unset auto complete
unsetopt correct_all
export EDITOR='vim'

