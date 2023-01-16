# install to .zshrc
echo "[[ -f ~/dotfiles/zshrc ]] && source ~/dotfiles/zshrc" >> ~/.zshrc

# create vim directories
mkdir -p ~/.vim/.undo
mkdir -p ~/.vim/.backup
mkdir -p ~/.vim/.swp

# install to .vimrc
echo 'if filereadable($HOME . "/dotfiles/vimrc")
  source ~/dotfiles/vimrc
endif' >> ~/.vimrc

# install to .tmux.conf
echo "source ~/dotfiles/tmux.conf" >> ~/.tmux.conf
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
