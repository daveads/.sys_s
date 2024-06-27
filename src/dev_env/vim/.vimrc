" vim plugin mangager
" execute pathogen#infect()
" call pathogen#helptags() 

" vim configs
set number
syntax on
colorscheme darkblue
set tabstop=4
set spell

"key remaps
map <C-g> :Gogo<CR>


" Start NERDTree and leave cursor in it
" autocmd VimEnter * NERDTree | wincmd p 

" Exit Vim if NERDTree is the only window left.
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


" changing tabs
map <S-Right> :tabn<CR>
map <S-Left>  :tabp<CR>


" mouse //so annoying 
" :set mouse=a


" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * silent NERDTreeMirror

autocmd vimenter * ++nested colorscheme gruvbox

" vimspector
let g:vimspector_enable_mappings = 'HUMAN'



" VIM-PLUG	
" Switching from pathogen to vim-plug
call plug#begin('~/.vim/bundle')

" plugins
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'preservim/nerdtree'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.8' }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'https://github.com/junegunn/fzf.vim.git'
Plug 'https://github.com/terryma/vim-multiple-cursors.git'
Plug 'https://github.com/tpope/vim-fugitive.git'
Plug 'https://github.com/vim-airline/vim-airline.git'
Plug 'https://github.com/vim-airline/vim-airline-themes.git'
Plug 'https://github.com/dart-lang/dart-vim-plugin.git'
Plug 'https://github.com/udalov/kotlin-vim.git'
Plug 'https://github.com/vimwiki/vimwiki.git'
Plug 'https://github.com/airblade/vim-gitgutter.git'
Plug 'https://github.com/tpope/vim-endwise.git'
Plug 'https://github.com/ctrlpvim/ctrlp.vim.git'
Plug 'https://github.com/Xuyuanp/nerdtree-git-plugin.git'
Plug 'https://github.com/rust-lang/rust.vim.git'
Plug 'https://github.com/MaxMEllon/vim-jsx-pretty.git'
Plug 'https://github.com/Yggdroot/indentLine.git'
Plug 'https://github.com/altercation/vim-colors-solarized.git'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
"https://github.com/ray-x/go.nvim
Plug 'https://github.com/crosbymichael/vim-cfmt.git'
Plug 'https://github.com/cespare/vim-toml.git'
Plug 'https://github.com/ntpeters/vim-better-whitespace.git'
Plug 'https://github.com/vivien/vim-linux-coding-style.git'
Plug 'https://github.com/wgwoods/vim-systemd-syntax.git'
Plug 'https://github.com/hashivim/vim-terraform.git'
Plug 'https://github.com/tpope/vim-git.git'
Plug 'https://github.com/uarun/vim-protobuf.git'
Plug 'https://github.com/tpope/vim-surround.git'
Plug 'https://github.com/junegunn/goyo.vim.git'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npx --yes yarn install' }
"https://github.com/instant-markdown/vim-instant-markdown
Plug 'christoomey/vim-tmux-navigator'
Plug 'git@github.com:octol/vim-cpp-enhanced-highlight.git'
Plug 'git@github.com:puremourning/vimspector.git'
Plug 'dense-analysis/ale'
Plug 'vim-ctrlspace/vim-ctrlspace'
Plug 'git@github.com:nicwest/vim-http.git'
Plug 'git@github.com:tpope/vim-commentary.git'
Plug 'git@github.com:xavierd/clang_complete.git'
Plug 'https://github.com/morhetz/gruvbox.git'
Plug 'ziglang/zig.vim'
Plug 'JuliaEditorSupport/julia-vim'
Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}
"check later
"Plug 'godlygeek/tabular'
"Plug 'https://github.com/preservim/vim-markdown.git'

"code completion //IntelliSense
"Config not set yet
Plug 'neovim/nvim-lspconfig' 
Plug 'hrsh7th/nvim-cmp' "completion plugin
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer' "buffer completion
Plug 'hrsh7th/cmp-path'  " path completion 
Plug 'hrsh7th/cmp-cmdline'

Plug 'hrsh7th/cmp-nvim-lua'

" vsnip users.
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

call plug#end()

"explore
" https://github.com/nvim-telekasten/telekasten.nvim
" https://github.com/nvim-lualine/lualine.nvim
" https://github.com/nvim-tree/nvim-web-devicons

" https://github.com/mrcjkb/rustaceanvim


"lua require("toggleterm").setup()
