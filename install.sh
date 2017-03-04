#!/usr/bin/env bash

if [ ! -f ~/.vim/autoload/plug.vim ]; then
    echo "\"**************Installing VIM!*******************\""
    
    brew install vim
    brew install macvim
    brew install clang
    
    echo "\"**************Installing vim-plug!******************\"" 
    
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    rm ~/.vimrc
    ln .vimrc ~/.vimrc
    ln -s /usr/local/bin/mvim vim
    
    echo "\"**************Installing Plugins!******************\"" 
    vim +PlugInstall +qall
    cd ~/.vim/plugged/YouCompleteMe
    ./install.py --clang-completer --tern-completer

fi


echo "\"**************Installing Plugins!******************\"" 
vim +PlugInstall +qall

echo "\"**************Installing Useful Applications******************\"" 
brew install ctags
brew install mariadb 

