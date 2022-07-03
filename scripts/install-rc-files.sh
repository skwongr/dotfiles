# install to .zshrc
echo "[[ -f ~/dotfiles/zshrc ]] && source ~/dotfiles/zshrc" >> ~/.zshrc

# install to .vimrc
echo 'if filereadable($HOME . "/dotfiles/vimrc")
  source ~/dotfiles/vimrc
endif' >> ~/.vimrc

# install to .tmux.conf
echo "source ~/dotfiles/tmux.conf" >> ~/.tmux.conf
