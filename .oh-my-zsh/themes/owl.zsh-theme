
PROMPT='%{$fg[$NCOLOR]%}%B%n%b%{$reset_color%}@%{$fg[green]%}%m%{$reset_color%}:%{$fg[blue]%}%B%c/%b%{$reset_color%}$(git_prompt_info) %(!.#.$)'
RPROMPT='[%*]'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}[%{$fg[cyan]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[green]%}] %{$fg[yellow]%}⚡%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%}]"
