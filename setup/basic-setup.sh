if [[ `uname` == 'Darwin' ]]; then
  which -s brew
  if [[ $? != 0 ]]; then
    echo 'Installing Homebrew and setting up...'
      ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
      brew update
      brew install htop node ruby
      brew tap caskroom/cask
  fi

  echo 'Tweaking OS X...'
    source 'etc/osx.sh'

  echo 'Installing the standard softwares devs use'
  brew cask install google-chrome dropbox 1password iterm2 amethyst sublime-text appcleaner

  # http://github.com/sindresorhus/quick-look-plugins
  echo 'Installing Quick Look plugins...'
    brew tap phinze/homebrew-cask
    brew install caskroom/cask/brew-cask
    brew cask install suspicious-package quicklook-json qlmarkdown qlstephen qlcolorcode
fi
