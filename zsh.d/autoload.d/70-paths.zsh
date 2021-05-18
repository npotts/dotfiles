
bindirs=(
    "/bin"
    "/sbin"
    "/usr/local/opt/postgresql@10/bin" #befor /usr/bin for useage on macOS
    "/usr/local/opt/postgresql@11/bin" #befor /usr/bin for useage on macOS
    "${HOME}/Library/Python/3.7/bin" 
    "/usr/local/opt/ruby/bin"
    "/usr/local/bin"
    "/usr/local/sbin"
    "/usr/bin"
    "/usr/sbin"
    "${HOME}/.bin"
    "${HOME}/bin"
    "${HOME}/.local/bin"
    "/usr/local/go/bin"
    "${HOME}/go/bin"
    "/Applications/VSCodium.app/Contents/Resources/app/bin"
    "/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
    "/Applications/MacVim.app/Contents/bin"
    "/usr/local/node/bin"
    "${MSP430ROOT}bin"
    "${HOME}/Workspace/FlameGraph"   # useful:  checkout  https://github.com/brendangregg/FlameGraph.git to ~/Workspace for flame utils
    "/opt/bin"
    "/opt/flyway-6.1.0"
    "/snap/bin"
)


_PATH=""
for path in $bindirs; do
    if [ -d "$path" ]; then
        _PATH="${_PATH}:${path}"
    fi
done

#for optbin in `/bin/find /opt -maxdepth 2 -iname "bin" -type d 2>&1 | /bin/grep -v "Permission denied"`; do
#  _PATH="${_PATH}:$optbin"
#done

export PATH="${_PATH}:${PATH}"
antibody bundle < ~/.antibody-plugins.txt

unset bindirs
unset _PATH
