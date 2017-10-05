export WORKSPACE="${HOME}/Workspace"
export GOPATH="${WORKSPACE}/go"
export PATH="${PATH}:/usr/local/bin:/usr/local/sbin:/usr/local/go/bin:${GOPATH}/bin"


source <(antibody init)
antibody bundle < ${HOME}/.antibody-plugins.txt

. ~/.zsh.d/`uname`
source ~/.zsh.d/functions
