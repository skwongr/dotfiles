# install neovim
# if [ -x "$(command -v brew)" ]; then
#   brew install neovim
# else
#   sudo apt install -y neovim
# fi

# symlink configs
mkdir -p ~/.config/nvim
ln -s ~/dotfiles/nvim/init.vim ~/.config/nvim/init.vim
ln -s ~/dotfiles/nvim/lua ~/.config/nvim/lua

echo "Remember to run :PackerCompile and :PackerInstall in nvim to install the plugins."
