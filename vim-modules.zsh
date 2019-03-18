echo "git cloning vim modules"
vimplugs=(
  https://github.com/itchyny/lightline.vim
  https://github.com/tpope/vim-sensible
  https://github.com/fatih/vim-go
  https://github.com/dracula/vim
  https://github.com/IN3D/vim-raml
  https://github.com/tpope/vim-fugitive
  https://github.com/isobit/vim-caddyfile
  https://github.com/Shougo/deoplete.nvim
  https://github.com/valloric/youcompleteme
  https://github.com/scrooloose/nerdcommenter
  https://github.com/wincent/command-t
  https://github.com/scrooloose/nerdtree
  https://github.com/Xuyuanp/nerdtree-git-plugin
  https://github.com/airblade/vim-gitgutter
  https://github.com/kien/rainbow_parentheses
  https://github.com/roxma/nvim-yarp
  https://github.com/roxma/vim-hug-neovim-rpc
  https://github.com/zchee/deoplete-go
  https://github.com/mxw/vim-jsx
  https://github.com/mileszs/ack.vim
  https://github.com/arcticicestudio/nord-vim
  https://github.com/rhysd/vim-gfm-syntax
  https://github.com/chrisbra/csv.vim
  https://github.com/kien/rainbow_parentheses.vim
)

pushd  ~/.vim/bundle &> /dev/null
  for i in $vimplugs; do
    u="${i##*/}"
    if [ -d $u ]; then
      echo "git pull in $u" 
      pushd $u &> /dev/null
      git checkout -f master &> /dev/null
      git pull &> /dev/null
      popd &> /dev/null
    else
      echo "git clone in $i"
      git clone --recurse-submodules $i &> /dev/null
    fi
done
popd &> /dev/null