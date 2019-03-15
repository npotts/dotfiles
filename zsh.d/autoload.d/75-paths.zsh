
bindirs=(
    "/bin/"
    "/sbin/"
    "/usr/local/opt/postgresql@10/bin" #befor /usr/bin for useage on macOS
    "/usr/local/opt/postgresql@11/bin" #befor /usr/bin for useage on macOS
    "/usr/local/bin"
    "/usr/local/sbin"
    "/usr/bin"
    "/usr/sbin"
    "${HOME}/.bin"
    "${HOME}/bin"
    "/usr/local/go/bin"
    "${HOME}/go/bin"
    "/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
    "/Applications/MacVim.app/Contents/bin"
    "/usr/local/node/bin"
    "${MSP430ROOT}bin"
    "${HOME}/Workspace/FlameGraph"   # useful:  checkout  https://github.com/brendangregg/FlameGraph.git to ~/Workspace for flame utils
    "/opt/bin"
)


_PATH=""
for path in $bindirs; do
    if [ -d "$path" ]; then
        _PATH="${_PATH}:${path}"
    fi
    
done

export PATH="${PATH}${_PATH}"
antibody bundle < ~/.antibody-plugins.txt

unset bindirs
unset _PATH
