export WORKSPACE="${HOME}/Workspace"
export GOPATH="${WORKSPACE}/go"
export PATH="${PATH}:/usr/local/bin:/usr/local/sbin:/usr/local/go/bin:${GOPATH}/bin"


source <(antibody init)
antibody bundle < ${HOME}/.antibody-plugins.txt

#source OS-specific options
. ~/.zsh.d/`uname`

#useful functions
source ~/.zsh.d/functions

#Lots of colors for ls
eval $(dircolors -b $HOME/.dircolors)
