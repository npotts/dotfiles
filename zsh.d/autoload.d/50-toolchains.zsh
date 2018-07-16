
#this checks for standard tool chains and sticks them in the path


# MSP430 toolchain
if [ -d "/opt/msp430" ]; then
  #Add to paths
  export MSP430ROOT="/opt/msp430"
  export PATH="${PATH}:${MSP430ROOT}/bin"
fi

#NodeJS
if [ -d /usr/local/node ]; then
    export PATH="${PATH}:/usr/local/node/bin"
fi


if [ -d ${WORKSPACE}/FlameGraph ]; then
  # useful:  checkout  https://github.com/brendangregg/FlameGraph.git to ~/Workspace for flame utils
  export PATH="${PATH}:${HOME}/Workspace/FlameGraph"
fi
