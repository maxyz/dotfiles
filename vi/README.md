# Vim/NeoVim configurations

To use this configuration in both vim and neovim you could use a symlink to point the default neovim directory to the default
vim directory:
`sh
ln -s ~/.vim ~/.config/nvim
`

The init.vim can replace the .vimrc, or you could add a symlink to it:
`sh
ln -s ~/.vim/init.vim ~/.vimrc
`

When using vim we need to install the pynvim python module for deoplete:
`sh
pip3 install --user pynvim --upgrade
`

