source <(antibody init)
antibody bundle < ${HOME}/.antibody-plugins.txt

export GOPATH="${HOME}/Workspace/go"
export PATH="${PATH}:/usr/local/go/bin:${GOPATH}/bin"

function gt {
  go test --coverprofile='cover.out' $@
  [ $? -eq 0 ] && go tool cover -html=cover.out -o cover.html
}
