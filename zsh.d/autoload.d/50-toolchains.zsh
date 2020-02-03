
#this checks for standard tool chains and sticks them in the path

# MSP430 toolchain
if [ -d "/opt/msp430" ]; then
  #Add to paths
  export MSP430ROOT="/opt/msp430/"
fi


function add_brew_links() {
  if [ -d "$1/opt/$2" ]; then
    #hack CFLAGS  LDFLAGS 
    export CFLAGS="${CFLAGS} -I$1/opt/$2/include"
    export LDFLAGS="${LDFLAGS} -L$1/opt/$2/lib"

    if [ -d "$1/opt/$2/lib/pkgconfig" ]; then
      export PKG_CONFIG_PATH="${PKG_CONFIG_PATH}:$1/opt/$2/lib/pkgconfig"
    fi
  fi
}


if command -v xcrun &> /dev/null; then 
  export CFLAGS="${CFLAGS} -I$(xcrun --show-sdk-path)/usr/include"
fi
if command -v brew &> /dev/null; then 
  brew_prefix=$(brew --prefix)
  add_brew_links "$brew_prefix" openssl
  add_brew_links "$brew_prefix" readline
  add_brew_links "$brew_prefix" libpq
  add_brew_links "$brew_prefix" ruby
fi
