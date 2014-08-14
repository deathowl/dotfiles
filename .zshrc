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
plugins=(git virtualenv  zsh-syntax-highlighting safe-paste osx knife vagrant ant  battery git-extra rails ruby composer django  python)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
PATH=$PATH:/opt/homebrew/bin:/opt/homebrew/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:$HOME/bin

### Added by the Heroku Toolbelt
PATH="/usr/local/heroku/bin:$PATH"
###unset auto complete
unsetopt correct_all
export EDITOR='vim'
export XDEBUG_CONFIG="idekey=phpStorm"
export ANDROID_HOME='/opt/local/share/java/android-sdk-macosx/'

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
PATH=$PATH:/opt/local/share/java/android-sdk-macosx/tools #add Android SDK to path for scripting
PATH=$PATH:/opt/local/share/java/android-sdk-macosx/platform-tools #add Android platform tools to path for scripting
export PATH=/usr/local/tranquil/bin:$PATH

#set LANG for Ruby.
export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
source ~/.zsh-autosuggestions/autosuggestions.zsh
source ~/.zsh-history/zsh-history-substring-search.zsh
# Enable autosuggestions automatically
zle-line-init() {
    zle autosuggest-start

    bindkey '^f' vi-forward-word
}
zle -N zle-line-init

# use ctrl+t to toggle autosuggestions(hopefully this wont be needed as
# zsh-autosuggestions is designed to be unobtrusive)
bindkey '^T' autosuggest-toggle


AUTOSUGGESTION_HIGHLIGHT_COLOR='fg=153'
