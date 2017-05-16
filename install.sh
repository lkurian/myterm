#!/bin/bash --login
USER_HOME=$(eval echo ~${SUDO_USER})
echo ${USER_HOME}

if brew ls --versions zsh > /dev/null; then
    echo 'Skipping zsh installation'
else 
    echo 'installing zsh'
    brew install zsh
fi


if brew ls --versions z > /dev/null; then
    echo 'Skipping z installation'
else 
    echo 'installing z'
    brew install z
fi

echo 'install oh-my-zsh'
rm -rf ${USER_HOME}/.oh-my-zsh
git clone git://github.com/robbyrussell/oh-my-zsh.git ${USER_HOME}/.oh-my-zsh
ln -s $(pwd)/bash/.bashrc ${USER_HOME}/.bashrc
ln -s $(pwd)/zsh/.zshrc ${USER_HOME}/.zshrc
chsh -s /bin/zsh

echo 'install zshmarks'
cd ${USER_HOME}/.oh-my-zsh/custom/plugins
git clone https://github.com/jocelynmallon/zshmarks.git
source ${USER_HOME}/.zshrc
cd -


echo 'git setup'
rm  ${USER_HOME}/.git-completion.bash
rm  ${USER_HOME}/.gitconfig
ln -s $(pwd)/git/.git-completion.bash ${USER_HOME}/.git-completion.bash
ln -s $(pwd)/git/.gitconfig ${USER_HOME}/.gitconfig

echo 'allow dotfiles to be visible'
defaults write com.apple.finder AppleShowAllFiles YES

if gem list -i hitch; then
    echo 'hitch already installed'
else
    echo 'hitch install start'
    sudo gem install hitch
    hitch --setup >> ~/.zshrc
    ln -s $(pwd)/hitch/.hitchrc ${USER_HOME}/.hitchrc
    ln -s $(pwd)/hitch/.hitch_pairs ${USER_HOME}/.hitch_pairs
    ln -s $(pwd)/hitch/.hitch_export_authors ${USER_HOME}/.hitch_export_authors
    echo 'hitch install complete'
fi

echo 'Copying Fonts'
cp -r $(pwd)/fonts/ ${USER_HOME}/Library/Fonts/

echo 'vim and vundle setup start'
rm -rf ${USER_HOME}/.vim/vundle
mkdir -p  ${USER_HOME}/.vim/vundle
git clone https://github.com/gmarik/vundle.git ${USER_HOME}/.vim/vundle
ln -s $(pwd)/vim/.vimrc ${USER_HOME}/.vimrc
ln -s $(pwd)/vim/.ctags ${USER_HOME}/.ctags
echo 'Now open vim and run :BundleInstall'

