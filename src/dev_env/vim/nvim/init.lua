-- Source .vimrc
vim.cmd([[
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc
]])

-- Require the separated configuration files
require('config.options')
require('config.nvim-tree')
require('config.nvim-treesitter')
require('config.nvim-cmp')
require('config.lsp')

