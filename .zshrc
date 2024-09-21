alias ll='ls -al'

export EDITOR='nvim'
alias vim="nvim"
alias vi="nvim"

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

bindkey '^ ' forward-word
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(rbenv init -)"

eval "$(atuin init zsh)"

autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^X^E' edit-command-line

alias grep='rg'

autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats '(%b)'
setopt prompt_subst
PROMPT='%n@%m %1~ ${vcs_info_msg_0_} %# '
