


if type pyenv > /dev/null; then
  export PYENV_ROOT="$HOME/.pyenv"
  # pyenb hacks oin $PATH
  eval "$(pyenv init -)"
fi


pyenv-macos-install () {
  # In order to build pyenv I needed tose  the CPPFLAGS like thus on macOS
  # CPPFLAGS=-I/usr/local/opt/zlib/include -I/usr/local/opt/sqlite3/include pyenv install -v 3.6.8
	echo YOU MIGHT NEED TO RUN 'brew install sqlite3 zlib'
	CPPFLAGS="-I/usr/local/opt/zlib/include -I/usr/local/opt/sqlite3/include" pyenv install -v $@
}

