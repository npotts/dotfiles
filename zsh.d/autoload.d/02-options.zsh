#Good grief - rm -fr * means delete dont ask
setopt rm_star_silent


# autocomplete directory = go to it
setopt auto_cd

#pick up .s in things like *x*
setopt globdots



autoload -U compinit
compinit
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%B no matches for: %d%b'


#enable ss user agent forwarding
zstyle :omz:plugins:ssh-agent agent-forwarding on



bindkey -e #yeah yeah yeah, vim + emacs keys
bindkey "[D" backward-word
bindkey "[C" forward-word
bindkey "^[a" beginning-of-line
bindkey "^[e" end-of-line
