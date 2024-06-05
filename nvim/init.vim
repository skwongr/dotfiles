set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

" vim-test
let test#strategy = "neovim"

lua require('plugins')
lua require('lsp')
lua require('keymaps')
