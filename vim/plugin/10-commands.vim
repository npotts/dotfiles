function! AcsCwd()
  if $GOPATH ==? ''
    echom "$GOPATH isnt set. Assuming you want ~/Workspace/go"
    cd ~/Workspace/go/src/github.com/NCAR/ACS
  else
    echom "Woohoo"
      cd $GOPATH/src/github.com/NCAR/ACS
  endif
endfunction

"acs -> cd to ACS dir
command! Acs call AcsCwd()
