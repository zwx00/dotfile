filetype on
filetype plugin on
filetype indent on
syntax on

set fillchars=""

cmap w!! %!sudo tee > /dev/null %

nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

let g:python_highlight_all = 1

set path=.,**
set wildmenu
set wildmode=longest:full,full
set wildignorecase
set number
set hidden
set autoread

set splitbelow
set splitright

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'Quramy/tsuquyomi'
Plugin 'leafgarland/typescript-vim'
Plugin 'vim-python/python-syntax'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'VundleVim/Vundle.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'Chiel92/vim-autoformat'
Plugin 'luochen1990/rainbow'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'venantius/vim-cljfmt'
Plugin 'tpope/vim-fireplace'
Plugin 'tpope/vim-classpath'
Plugin 'tpope/vim-vinegar'
Plugin 'guns/vim-clojure-static'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-fugitive'
Plugin 'ashisha/image.vim'
Plugin 'tomlion/vim-solidity'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'w0rp/ale'
Plugin 'skywind3000/asyncrun.vim'
Plugin 'mattn/emmet-vim'
Plugin 'Shougo/denite.nvim'
Plugin 'posva/vim-vue'
call vundle#end()

filetype plugin indent on


colorscheme anotherdark


let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_winsize = 20
let g:netrw_altv = 1


" Use 4 space tabs by default
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab

autocmd Filetype javascript setlocal tabstop=2
autocmd Filetype javascript setlocal shiftwidth=2
autocmd Filetype javascript setlocal expandtab
" Mouse support
set mouse=a

" Highlight search results
set hlsearch


" Show line number and file name
set laststatus=2
set statusline=   " clear the statusline for when vimrc is reloaded
set statusline+=%-3.3n\                      " buffer number
set statusline+=%f\                          " file name
set statusline+=%h%m%r%w                     " flags
set statusline+=[%{strlen(&ft)?&ft:'none'},  " filetype
set statusline+=%{strlen(&fenc)?&fenc:&enc}, " encoding
set statusline+=%{&fileformat}]              " file format
set statusline+=%=                           " right align
set statusline+=char\ %b,0x%-8B\             " current char
set statusline+=line\ %-14.(%l,%c%V%)\ %<%P  " position

" Allow copy pasting more than 50 lines
" Store marks in last 50 files, registers up to 300 lines, 20 kb
set viminfo='50,<300,s20

" Highlight trailing whitespace
" highlight ExtraWhitespace ctermbg=red guibg=red
" match ExtraWhitespace /\s\+$/
" autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
" autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
" autocmd InsertLeave * match ExtraWhitespace /\s\+$/
" autocmd BufWinLeave * call clearmatches()
" autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/

" C/C++/Java: Auto indent, auto-complete multiline comments
autocmd FileType c,cpp,java setlocal cindent

" In Makefiles, don't expand tabs to spaces, since we need the actual tabs
autocmd FileType make setlocal noexpandtab

let g:rainbow_active = 1

" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = 'Ξ'
let g:airline_symbols.maxlinenr = ''

let g:airline_theme='minimalist'

" js dev

let g:ale_sign_error = '●'
let g:ale_sign_warning = '.'
let g:ale_fixers = { 'javascript': ['standard'] }
let g:ale_linters = { 'javascript': ['standard'] }
let g:ale_javascript_standard_use_global = 1
let g:ale_javascript_standard_executable = '/usr/local/bin/semistandard'
let g:ale_fixers_ignore = ['eslint']
let g:ale_linters_ignore = ['eslint']

let g:ale_javascript_eslint_use_global = 1
let g:ale_javascript_eslint_executable = '/usr/local/bin/eslint'

autocmd BufWritePost *.js AsyncRun -post=checktime standard --fix %
autocmd BufWritePost *.py AsyncRun -post=checktime black %

let g:user_emmet_leader_key='<C-E>'
let g:typescript_compiler_options="--experimentalDecorators"

" ctrlp

let g:ctrlp_custom_ignore = 'node_modules\|git'


" autoreload for .vimrc

augroup myvimrchooks
    au!
    autocmd bufwritepost .vimrc source ~/.vimrc
augroup END

command! Settings e ~/.vimrc
