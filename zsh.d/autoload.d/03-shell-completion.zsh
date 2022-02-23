
mkdir -p ~/.zsh.d/zfunc
poetry completions zsh > ~/.zsh.d/zfunc/_poetry

fpath+=~/.zsh.d/zfunc
autoload -U compinit

compinit -i
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%B no matches for: %d%b'

