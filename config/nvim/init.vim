call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

" Declare the list of plugins.
Plug 'tpope/vim-sensible'
Plug 'christoomey/vim-tmux-navigator'
Plug 'vim-airline/vim-airline'
" File management
Plug 'scrooloose/nerdtree'
" File Icon
Plug 'ryanoasis/vim-devicons'
" Comment
Plug 'preservim/nerdcommenter'
" Surround
Plug 'tpope/vim-surround'
" Snippest
Plug 'SirVer/ultisnips'
" Start Screen
Plug 'mhinz/vim-startify'
" Move line
Plug 'matze/vim-move'
" Global Search
Plug 'mileszs/ack.vim'
" Git Integrate
Plug 'tpope/vim-fugitive'
" Git Diff
Plug 'airblade/vim-gitgutter'
" Auto closing html
Plug 'alvan/vim-closetag'
" color code background
Plug 'ap/vim-css-color'
" MD preview
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
" Syntax Check
Plug 'scrooloose/syntastic'
" CSV file
Plug 'chrisbra/csv.vim'
" Import cost
Plug 'yardnsm/vim-import-cost'  
" White Space
Plug 'ntpeters/vim-better-whitespace'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Theme
Plug 'dracula/vim'
" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" Plugin Setting

let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
let g:airline_theme='dracula'
let g:closetag_filenames='*.html,*.vue,*.php'
let g:airline#extensions#whitespace#enabled=1

set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching 
set ignorecase              " case insensitive 
set mouse=v                 " middle-click paste with 
set hlsearch                " highlight search 
set incsearch               " incremental search
set tabstop=4               " number of columns occupied by a tab 
autocmd Filetype css setlocal tabstop=2
autocmd Filetype vue setlocal tabstop=2
autocmd Filetype javascript setlocal tabstop=2
autocmd Filetype javascriptreact setlocal tabstop=2
autocmd Filetype typescript setlocal tabstop=2
autocmd Filetype typescriptreact setlocal tabstop=2
autocmd Filetype perl setlocal tabstop=2
autocmd Filetype r setlocal tabstop=2
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=0            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
set cc=80                  " set an 80 column border for good coding style
filetype plugin indent on   "allow auto-indenting depending on file type
syntax on                   " syntax highlighting
set mouse=a                 " enable mouse click
set clipboard=unnamedplus   " using system clipboard
filetype plugin on
set cursorline              " highlight current cursorline
set ttyfast                 " Speed up scrolling in Vim
set spell                 " enable spell check (may need to download language package)
" set noswapfile            " disable creating swap file
" set backupdir=~/.cache/vim " Directory to store backup files.

" color schemes
 if (has("termguicolors"))
 set termguicolors
 endif
 syntax enable
" colorscheme evenig
colorscheme dracula " open new split panes to right and below
set splitright
set splitbelow

" use <tab> to trigger completion and navigate to the next complete item
" https://github.com/SirVer/ultisnips/issues/1052
let g:UltiSnipsExpandTrigger = "<nop>"
" 
" function! CheckBackspace() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction
" 
" inoremap <silent><expr> <Tab>
"       \ coc#pum#visible() ? coc#pum#next(1) :
"       \ CheckBackspace() ? "\<Tab>" :
"       \ coc#refresh()
  
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" let g:coc_snippet_next = '<tab>' 
" NERD Tree Key mapping
nnoremap <silent> <C-a> :exec 'NERDTreeToggle' <CR>
nmap  <Leader>r :NERDTreeRefreshRoot <CR>
" Buffer
nnoremap <Leader>[ :bprevious<CR>
nnoremap <Leader>] :bnext<CR>
nnoremap <Leader>1 :bfirst<CR>
nnoremap <Leader>2 :bfirst<CR>:bn<CR>
nnoremap <Leader>3 :bfirst<CR>:2bn<CR>
nnoremap <Leader>4 :bfirst<CR>:3bn<CR>
nnoremap <Leader>5 :bfirst<CR>:4bn<CR>
nnoremap <Leader>6 :bfirst<CR>:5bn<CR>
nnoremap <Leader>7 :bfirst<CR>:6bn<CR>
nnoremap <Leader>8 :bfirst<CR>:7bn<CR>
nnoremap <Leader>9 :blast<CR>
nnoremap <Leader>w :bd<CR>
" Comment
map <C-_> <Leader>c<space>
" Move line
vmap <C-j> <Plug>MoveBlockDown
vmap <C-k> <Plug>MoveBlockUp
nmap <C-j> <Plug>MoveLineDown
nmap <C-k> <Plug>MoveLineUp
" Global Search in cwd
nnoremap <C-f> :Ack!<Space>
" Ctrl p
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
