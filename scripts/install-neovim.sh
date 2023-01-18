# install neovim
if [ -x "$(command -v brew)" ]; then
  brew install neovim ripgrep
else
  sudo add-apt-repository ppa:neovim-ppa/stable
  sudo apt update
  sudo apt install -y neovim ripgrep
fi

# symlink configs
mkdir -p ~/.config/nvim
ln -s ~/dotfiles/nvim/init.vim ~/.config/nvim/init.vim
ln -s ~/dotfiles/nvim/lua ~/.config/nvim/lua

echo "Remember to run :PackerCompile and :PackerInstall in nvim to install the plugins."
