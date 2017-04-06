#!/bin/bash --login
USER_HOME=$(eval echo ~${SUDO_USER})
echo ${USER_HOME}

echo 'installing zsh'
brew install zsh

echo 'install oh-my-zsh'
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

cp ./bash/.bashrc ${USER_HOME}
cp ./zsh/.zshrc ${USER_HOME}

echo 'install zshmarks'
cd ${USER_HOME}/.oh-my-zsh/custom/plugins
git clone https://github.com/jocelynmallon/zshmarks.git
source ${USER_HOME}/.zshrc
cd -

echo 'git setup'
cp ./git/.git-completion.bash ${USER_HOME}
cp ./git/.gitconfig ${USER_HOME}

echo 'allow dotfiles to be visible'
defaults write com.apple.finder AppleShowAllFiles YES

echo 'hitch install start'
gem install hitch
hitch --setup >> ~/.zshrc

cp ./hitch/.hitchrc ${USER_HOME}/
cp ./hitch/.hitch_pairs ${USER_HOME}/
cp ./hitch/.hitch_export_authors ${USER_HOME}/
echo 'hitch install complete'


echo 'vim and vundle setup start'
rm -rf ${USER_HOME}/.vim/vundle
mkdir -p  ${USER_HOME}/.vim/vundle
git clone https://github.com/gmarik/vundle.git ${USER_HOME}/.vim/vundle
cp ./vim/.vimrc ${USER_HOME}
echo 'Now open vim and run :BundleInstall'

