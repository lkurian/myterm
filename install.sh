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
ln -fs $(pwd)/bash/.bashrc ${USER_HOME}/.bashrc
ln -fs $(pwd)/zsh/.zshrc ${USER_HOME}/.zshrc
chsh -s /bin/zsh

echo 'install zshmarks'
cd ${USER_HOME}/.oh-my-zsh/custom/plugins
git clone https://github.com/jocelynmallon/zshmarks.git
source ${USER_HOME}/.zshrc
cd -


echo 'git setup'

echo I like to know your name to configure git
read -p 'name: ' emailAddress

echo I like to know your email address to configure git
read -p 'email address: ' emailAddress

sed -i.bak -e "s/\${emailAddress}/${emailAddress}/g" -e "s/\${name}/${name}/g" $(pwd)/git/.gitconfig

rm  ${USER_HOME}/.git-completion.bash
rm  ${USER_HOME}/.gitconfig
ln -fs $(pwd)/git/.git-completion.bash ${USER_HOME}/.git-completion.bash
ln -fs $(pwd)/git/.gitconfig ${USER_HOME}/.gitconfig
ln -fs $(pwd)/git/.global_ignore ${USER_HOME}/.global_ignore
git config --global core.excludesfile ${USER_HOME}/.global_ignore

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

echo 'setting up geeknote'
mkdir ${USER_HOME}/installers
cd ${USER_HOME}/installers 
git clone https://github.com/pipakin/geeknote.git
cd geeknote 
sudo python ./setup.py install
geeknote settings --editor vim
geeknote login

echo 'install ack for vim and terminal'
brew install ack

echo 'vim and vundle setup start'
brew install vim --with-override-system-vim
brew upgrade vim
rm -rf ${USER_HOME}/.vim/vundle
mkdir -p  ${USER_HOME}/.vim/vundle
git clone https://github.com/gmarik/vundle.git ${USER_HOME}/.vim/vundle
ln -fs $(pwd)/vim/.vimrc ${USER_HOME}/.vimrc
ln -fs $(pwd)/vim/.ctags ${USER_HOME}/.ctags
echo 'Now open vim and run :BundleInstall'

