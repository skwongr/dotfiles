set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc
runtime! plugin/**/*.vim
runtime! after/plugin/**/*.vim

" vim-test
let test#strategy = "neovim"

lua require('plugins')
lua require('lsp')
lua require('keymaps')
