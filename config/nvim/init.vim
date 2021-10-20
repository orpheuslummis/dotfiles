" 💖
" TODO https://github.com/hrsh7th/nvim-cmp/ and https://github.com/neovim/nvim-lspconfig/wiki/Autocompletion

call plug#begin()
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'nvim-lua/plenary.nvim'
Plug 'tami5/sqlite.lua'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'plasticboy/vim-markdown' " tree-sitter markdown stuff is not ready as of 2021

Plug 'alvan/vim-closetag'

Plug 'tpope/vim-fugitive'

Plug 'terrortylor/nvim-comment'
Plug 'blackCauldron7/surround.nvim'

Plug 'akinsho/toggleterm.nvim'
Plug 'famiu/bufdelete.nvim'

Plug 'lervag/wiki.vim'

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp/'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'ray-x/lsp_signature.nvim'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'

" Plug 'NLKNguyen/papercolor-theme'
Plug 'projekt0n/github-nvim-theme'
call plug#end()

set mouse=a
set undofile

set shiftwidth=4
set expandtab
set tabstop=4
set smartindent
" set autoindent
" set nowrap

" set relativenumber
" set number
" set numberwidth=5

set ignorecase
set smartcase

set statusline=                                                                       
set statusline+=%F\                          " filename                               
set statusline+=%h%m%r%w                     " status flags                           
set statusline+=%y                           " file type                              
set statusline+=%=                           " right align remainder                  
set statusline+=%-14(%l,%c%V%)               " line, character                        
"set statusline+=[%{expand('%:e')}]

set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set foldlevelstart=99

" let g:vimwiki_list = [{'path': '~/notes/', 'syntax': 'markdown', 'ext': '.md'}]
" let g:vimwiki_header_type = '#'
" let g:vimwiki_folding = 'custom'

let g:vim_markdown_math = 1
let g:vim_markdown_toc_autofit = 1
let g:vim_markdown_frontmatter = 1

let g:wiki_root = '~/notes'
let g:wiki_filetypes = ['md']
let g:wiki_link_extension = '.md'

let g:closetag_filenames = '*.html,*.jsx,*.tsx'
let g:closetag_regions =  {
\ 'typescript.tsx': 'jsxRegion,tsxRegion',
\ 'javascript.jsx': 'jsxRegion',
\ }

set termguicolors
set cursorline

" localtime: Mexico
" I want darkness from 20 to 08 localtime, otherwise light
" assuming the machine is UTC and local time is -5: 20 -> 1, 08 -> 13
let t = strftime("%H") 
if t >= 0 && t <= 11
    autocmd VimEnter * ++nested colorscheme github_dark_default
    " autocmd VimEnter * ++nested colorscheme github_dark
else
    autocmd VimEnter * ++nested colorscheme github_light_default
    " autocmd VimEnter * ++nested colorscheme github_light
endif

autocmd TermOpen * setlocal nonumber norelativenumber nocursorline
autocmd FileType qf setlocal nonumber norelativenumber
" autocmd BufWinEnter *.md Toc

tnoremap <Esc> <C-\><C-n>

nnoremap <silent> ge <cmd>lua vim.lsp.diagnostic.set_loclist()<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>

nnoremap <silent><C-q> :quit<CR><esc>
" nnoremap <silent><C-q> :Bdelete<CR><esc>
nnoremap <silent><esc> :noh<CR><esc>
nnoremap <silent><C-s> :write<CR><esc>
nnoremap <silent><C-f> <Nop>
nnoremap <silent><C-b> <Nop>

nnoremap <silent><C-p> :FZF<CR>
nnoremap <silent><C-h> :History<CR>
nnoremap <silent><C-l> :BLines<CR>

cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

"set completeopt=menu,menuone,noselect
set completeopt=menuone,noselect

lua require('config')
