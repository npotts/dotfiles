# Various function defs

function dfs { cd ${DOTFILES}; }
function dfsup { cd ${DOTFILES}; git pull; git submodule init; git submodule update; }

function gt {
  go test --coverprofile='cover.out' $@
  [ $? -eq 0 ] && go tool cover -html=cover.out -o cover.html
}

alias ".."="cd .."
#alias "."="ls -al ."

function work { cd ${WORKSPACE}; }

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

function tcp-fwd {
  if [[ -z "$1" || -z "$2" ]]; then
    echo "tcp-fwd: Use socat to create a tcp forwarding tunnel"
    echo "Usage: tcp-fwd <local-port> <target:targetport>"
    return;
  fi

  socat TCP-LISTEN:$1,reuseaddr TCP:$2
}

function declutter {
  echo "Removing cruft (recursively) in `pwd`"
  find . -iname "._*" -or -iname ".DS_Store" -exec rm {} \;
}


function rsync_sane {
  echo "Rsync, less common cruft"
  rsync -a --cvs-exclude --exclude=".git/" $@
}

function http_here {
  if [[ -z "$1" ]]; then
    echo "httpd_here: Host a webpage on port from the current working dir"
    echo "Usage: httpd_here <tcp-listen-port>"
    return;
  fi
  python -m SimpleHTTPServer $1
}


function roll-rev {
  if [[ -z "$1" || -z "$2" ]]; then 
    echo "Usage: roll-rev <prev-year> <next-year>"
    echo "This tool will replace all instances of <prev> with <next> on the code base."
    echo "This takes some special actions to get a clean git tree if you are on the root of a git repo."
    return;
  fi


  if [[ -d ".git" ]]; then  
    echo "This will do some serious git actions to get a clean tree and then roll the year" 
    echo
    echo "Ctrl-C quickly if this is a bad idea"
    read
    git reset --hard
    git clean -f -x -d
    git clean -f -X -d
  fi

  if [ -d vendor ]; then
    mv vendor ..
  fi

  ack -l -- "$1" | xargs sed -i "" "s/$1/$2/g"

  if [ -d ../vendor ]; then
    mv ../vendor .
  fi
  
  echo 
  echo Replacement is done.  Look at the log to see if the changes look ok.
  echo
  if [[ -d ".git" ]]; then;
    git diff
    echo If all looks well, do a 'git commit -a' and push the changes;
  fi

}

function docker-image-declutter {
  docker images | grep "<none>" | cut -d " " -f 33 | xargs docker rmi -f
}

function reload {
  source ~/.zshrc
}
