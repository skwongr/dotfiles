# dotfiles
Sharing my dotfiles is inspired by [thoughtbot](https://github.com/thoughtbot/dotfiles) and [jcaffey](https://github.com/jcaffey/dotfiles)

Take what you like and keep learning!

## Install
Clone onto your computer:

`git clone git://github.com/skwongr/dotfiles.git ~/dotfiles`

## zshrc (~/.zshrc)
```
[[ -f ~/dotfiles/zshrc ]] && source ~/dotfiles/zshrc
```

## tmux (~/.tmux.conf)
```
source ~/dotfiles/tmux.conf
```

## vimrc (~/.vimrc)
```
if filereadable($HOME . "/dotfiles/vimrc")
  source ~/dotfiles/vimrc
endif
```

## nvim
```
ln -s ~/dotfiles/nvim/init.vim ~/.config/nvim/init.vim
ln -s ~/dotfiles/nvim/lua ~/.config/nvim/lua
```

## Ghostty (~/.config/ghostty/config)
```
config-file=~/dotfiles/config.ghostty
```

## WezTerm (~/.wezterm.lua)
```
dofile(os.getenv("HOME") .. "/dotfiles/wezterm.lua")
```
