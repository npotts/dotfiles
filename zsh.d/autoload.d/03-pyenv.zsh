
# In order to build pyenv I needed tose  the CPPFLAGS like thus on macOS
# CPPFLAGS=-I/usr/local/opt/zlib/include -I/usr/local/opt/sqlite3/include pyenv install -v 3.6.8
export PYENV_ROOT="$HOME/.pyenv"
eval "$(pyenv init -)"
