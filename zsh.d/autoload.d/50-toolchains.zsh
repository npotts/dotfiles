
#this checks for standard tool chains and sticks them in the path

# MSP430 toolchain
if [ -d "/opt/msp430" ]; then
  #Add to paths
  export MSP430ROOT="/opt/msp430/"
fi



if [ -d "/usr/local/opt/openssl" ]; then
  #brew's openssl install alter CPPFlags and LDFlags
  export CPPFLAGS=-I/usr/local/opt/openssl/include
  export LDFLAGS=-L/usr/local/opt/openssl/lib
fi
