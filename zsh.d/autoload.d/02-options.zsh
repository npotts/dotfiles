bindkey -e #yeah yeah yeah, vim + emacs keys


# autocomplete directory = go to it
setopt auto_cd

#pick up .s in things like *x*
setopt globdots



autoload -U compinit
compinit
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%B no matches for: %d%b'
