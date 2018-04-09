#!/usr/bin/env bash

# Install command-line tools using Homebrew.
#ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils

# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names
# Install Bash 4.
# Note: don’t forget to add `/usr/local/bin/bash` to `/etc/shells` before
# running `chsh`.
brew install bash
brew tap homebrew/versions
brew install bash-completion2

# Switch to using brew-installed bash as default shell
if ! fgrep -q '/usr/local/bin/bash' /etc/shells; then
  echo '/usr/local/bin/bash' | sudo tee -a /etc/shells;
  chsh -s /usr/local/bin/bash;
fi;

# Install `wget` with IRI support.
brew install wget --with-iri

# Install more recent versions of some OS X tools.
brew install vim --override-system-vi
brew install homebrew/dupes/grep
brew install homebrew/dupes/openssh
brew install homebrew/dupes/screen
brew install homebrew/php/php56 --with-gmp

# Install other useful binaries.
brew install ack
brew install dark-mode
brew install git
brew install git-lfs

#LS - my additional installs
brew install atk
brew install cairo
brew install cloog
brew install faac
brew install ffmpeg
brew install fontconfig
brew install freetype
brew install gcc
brew install gdk-pixbuf
brew install gettext
brew install ghc
brew install glib
brew install gmp
brew install gobject-introspection
brew install gtk+
brew install harfbuzz
brew install icu4c
brew install imagemagick
brew install isl
brew install jpeg
brew install lame
brew install libffi
brew install libmpc
brew install libpng
brew install libtiff
brew install libtool
brew install mpfr
brew install mplayer
brew install openssl
brew install pandoc
brew install pango
brew install pixman
brew install pkg-config
brew install readline
brew install wget
brew install x264
brew install xvid
brew install xz
brew install tree
brew install maven
brew install tldr
brew install chromedriver

# install node
brew install node

# Tools for live-reloading
brew install ag
brew install entr

#installing r
brew tap homebrew/science
brew install Caskroom/cask/xquartz
brew install r

# Installing python plus minimal package install
brew install python3
brew install python
pip3 install virtualenv virtualenvwrapper
pip3 install jupyter
pip3 install numpy
pip3 install pandas
pip3 install matplotlib
pip3 install speedtest-cli
pip3 install jupyter
pip3 install numpy
pip3 install pandas
pip3 install matplotlib
pip3 install grip

# install selected data science @ the cmd tools
brew install cowsay
pip3 install csvkit
pip3 install jupyterlab # data science ide
npm install -g xml2json-command
npm install stacks-cli -g
npm install -g doctoc # inserts toc into .md file

# installing docker
brew install docker
brew install boot2docker
brew install docker-compose docker-machine
# associate VM ip that runs docker with dockerhost
echo $(boot2docker ip) dockerhost | sudo tee -a /etc/hosts

# installing apps
brew cask install --appdir="~/Applications" torguard
brew cask install --appdir="~/Applications" dropbox
brew cask install --appdir="~/Applications" google-chrome
brew cask install --appdir="~/Applications" vlc
brew cask install --appdir="~/Applications" iterm2
brew cask install --appdir="~/Applications" sublime-text
brew cask install --appdir="~/Applications" intellij-idea-ce-
# install prettify json sublime add on
(
	cd /Users/luke.singham/Library/Application\ Support/Sublime\ Text\ 3/Packages
	git clone https://github.com/dzhibas/SublimePrettyJson.git
)
brew cask install --appdir="~/Applications" google-backup-and-sync
brew cask install --appdir="~/Applications" skype
brew cask install --appdir="~/Applications" mendeley-desktop
brew cask install --appdir="~/Applications" rstudio
brew cask install --appdir="~/Applications" teamviewer
brew cask install --appdir="~/Applications" flux
brew cask install --appdir="~/Applications" google-photos-backup
brew cask install --appdir="~/Applications" sourcetree
brew cask install --appdir="~/Applications" spotify
brew cask install --appdir="~/Applications" alfred
brew cask install --appdir="~/Applications" atom
brew cask install --appdir="~/Applications" spectacle
brew cask install --appdir="~/Applications" virtualbox
brew cask install --appdir="~/Applications" vagrant
brew cask install --appdir="~/Applications" vagrant-manager
brew cask install --appdir="~/Applications" pycharm-ce
brew cask install --appdir="~/Applications" licecap # make gifs
brew cask install --appdir="~/Applications" postico

# Install LaTeX
brew cask install mactex

# Install java
brew cask install java

# Fix git commit issue
git config --global --add commit.gpgsign false

# Remove outdated versions from the cellar.
brew cleanup

#create path file (read by .bash_profile) saves interfering w. /etc/path
echo "usr/local/sbin" >> .path

#turn off boot noise
nvram SystemAudioVolume=%80
