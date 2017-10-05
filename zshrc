source <(antibody init)
antibody bundle < ${HOME}/.antibody-plugins.txt


export WORKSPACE="${HOME}/Workspace"
export GOPATH="${WORKSPACE}/go"
export PATH="${PATH}:/usr/local/go/bin:${GOPATH}/bin"

function gt {
  go test --coverprofile='cover.out' $@
  [ $? -eq 0 ] && go tool cover -html=cover.out -o cover.html
}

function work { cd ${WORKSPACE}; }
function acs { cd ${GOPATH}/src/github.com/NCAR/ACSd; }
