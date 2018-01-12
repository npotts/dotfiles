# Various function defs

function dfs { cd ${DOTFILES}; }
function dfsup { cd ${DOTFILES}; git pull; git submodule init; git submodule update; }

function gt {
  go test --coverprofile='cover.out' $@
  [ $? -eq 0 ] && go tool cover -html=cover.out -o cover.html
}

alias ".."="cd .."
function work { cd ${WORKSPACE}; }
function acs { cd ${GOPATH}/src/github.com/NCAR/ACSd; }


function sss {
	if [[ -z "$1" || -z "$2" || -z "$3" ]]; then
    echo "sss: socat socket starter:  Expose a Serial Port as a TCP socket"
    echo "Usage: sss <tcp-listen-port> <serial-device> <serial-baud>"
    return;
  fi

  case "`uname`" in
    Linux)
      socat TCP-LISTEN:$1,fork,reuseaddr FILE:$2,cs8,rawer,ispeed=$3,ospeed=$3
      ;;
    Darwin)
      echo "socat on macOS is a bit broken.  Use minicom to set the baud rate"
      socat TCP-LISTEN:$1,fork,reuseaddr FILE:$2,cs8,rawer
      ;;
    FreeBSD)
      socat TCP-LISTEN:$1,fork,reuseaddr FILE:$2,cs8,rawer,ispeed=$3,ospeed=$3
      ;;
    *)
    echo "I dont know how to run socat on `uname`"
    ;;
  esac
}


function declutter {
  echo "Removing cruft (recursively) in `pwd`"
  find . -iname "._*" -or -iname ".DS_Store" -exec rm {} \;
}


function rsync_sane {
  echo "Rsync, less common cruft"
  rsync -a --cvs-exclude --exclude=".git/" $@
}
