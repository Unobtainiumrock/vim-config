" Enable syntax highlighting
syntax on

" Set line numbers
set number

" Enable relative line numbers
set relativenumber

" Set tabs and indentation
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent

" Enable search highlighting
set hlsearch

" Ignore case in search patterns
set ignorecase
set smartcase

" Show matching parentheses
set showmatch

" Enable mouse support
set mouse=a

" Set the clipboard to use the system clipboard
set clipboard=unnamedplus

" Enable file type detection and plugin support
filetype plugin indent on

" Set a color scheme
colorscheme desert

" Show line and column number in the status line
set ruler

" Show command in the bottom bar
set showcmd

" Enable line wrapping
set wrap

" Allow backspace in insert mode
set backspace=indent,eol,start
call plug#begin('~/.vim/plugged')

" File explorer
Plug 'scrooloose/nerdtree'

map <F2> :NERDTreeToggle<CR>

" Status line
Plug 'vim-airline/vim-airline'

" Enable powerline fonts
let g:airline_powerline_fonts = 1


" Fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Add FZF key bindings
" For search
nnoremap <C-p> :Files<CR>
nnoremap <C-b> :Buffers<CR>

" More FZF features
let g:fzf_action = {
    \ 'enter': 'edit',
    \ 'ctrl-t': 'tabedit',
    \ 'ctrl-x': 'split',
    \ 'ctrl-v': 'vsplit'}

function! SearchFromCurrentFileDirectory()
    let l:current_file_directory = expand('%:p:h')
    execute 'cd ' . l:current_file_directory
    execute 'Rg'
endfunction


nnoremap <C-f> :call SearchFromCurrentFileDirectory()<CR>


" Git integration
Plug 'tpope/vim-fugitive'

" Autocompletion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Use tab for trigger completion with characters ahead and navigate
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


" Syntax highlighting
Plug 'sheerun/vim-polyglot'

" Python
let g:coc_global_extensions = ['coc-pyright']

" Go
let g:coc_global_extensions = ['coc-go']

" Java
let g:coc_global_extensions = ['coc-java']

" TypeScript
let g:coc_global_extensions = ['coc-tsserver']

" HTML, CSS, JSON
let g:coc_global_extensions = ['coc-html', 'coc-css', 'coc-json']

call plug#end()

