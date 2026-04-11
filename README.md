# dotfiles
Sharing my dotfiles is inspired by [thoughtbot](https://github.com/thoughtbot/dotfiles) and [jcaffey](https://github.com/jcaffey/dotfiles)

Take what you like and keep learning!

## Install
Clone onto your computer:

`git clone git://github.com/skwongr/dotfiles.git ~/dotfiles`

## vimrc (~/.vimrc)
```
if filereadable($HOME . "/dotfiles/vimrc")
  source ~/dotfiles/vimrc
endif
```

## zshrc (~/.zshrc)
```
[[ -f ~/dotfiles/zshrc ]] && source ~/dotfiles/zshrc
```

## tmux (~/.tmux.conf)
```
source ~/dotfiles/tmux.conf
```

## Ghostty (~/.config/ghostty/config)
```
config-file=~/dotfiles/config.ghostty
```

## WezTerm (~/.wezterm.lua)
```
dofile(os.getenv("HOME") .. "/dotfiles/wezterm.lua")
```
