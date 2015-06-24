#!/usr/bin/zsh
# Load from Resource files
#for file in /etc/zsh/zsh.d/rc/*.rc; do
for file in $HOME/.zsh.d/rc/*.rc; do
	source $file
done


#Not sure what this was all for, but dont want ot delete it 
shopts=$-
setopt nullglob
for sh in /etc/profile.d/*.sh ; do
	[ -r "$sh" ] && . "$sh"
done
unsetopt nullglob
set -$shopts
unset sh shopts
