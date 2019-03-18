
if [ -e /usr/local/opt/chruby/share/chruby/chruby.sh ]; then 
  source /usr/local/opt/chruby/share/chruby/chruby.sh
fi 

if [ -e /usr/local/opt/chruby/share/chruby/auto.sh ]; then
  source /usr/local/opt/chruby/share/chruby/auto.sh
fi

# ruby specific
if type rbenv > /dev/null; then
  # alterd $PATH so do after PATH has been set
  eval "$(rbenv init -)"
fi


function ruby_rbenv_install() {
  # https://stackoverflow.com/questions/9602806/bundler-not-working-with-rbenv-could-not-find-gem
  rm -fr  ~/.rbenv ~/.gem
  rbenv install $1
  rbenv rehash # for paranoia's sake
  rbenv global $1
  rbenv local $1
  gem env # to check that everything was pointing at 1.9 and not the system
  gem install --no-ri --no-rdoc bundler
  rbenv rehash # necessary to load up the bundle executable
  bundle --path=vendor/bundle
}
