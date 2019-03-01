
#this checks for standard tool chains and sticks them in the path

# MSP430 toolchain
if [ -d "/opt/msp430" ]; then
  #Add to paths
  export MSP430ROOT="/opt/msp430/"
fi