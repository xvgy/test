set noundofile
set nobackup
set noswapfile

set nocompatible
set encoding=UTF-8
filetype off                  " required
filetype plugin indent on
syntax on

" MapLeader
let mapleader = ';'
let maplocalleader='='
" Global flag for substitution
set gdefault

" Case sensibility
set ignorecase
set smartcase

" Exit insert mode
imap <C-j> <Esc>

" Split Management / Resizing splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-L> <C-W><C-L>

" Remove search highlights
nmap <Leader><space> :nohlsearch<cr>

set clipboard+=unnamedplus

" Windows only: Copy/Paste into system's clipboard
if has("win32") || has("win64")
    vmap <C-C> "*y
    imap <C-V> <ESC>"*p`]a
endif

" Close buffer whil conserving window layout
command! BC :bp | sp | bn | bd

" Convert DOS line-endings into UNIX line-endings
command! UnixLines :%s/\r//g | :w

" Function to handle URLs
function! HandleURL()
  let l:uri = matchstr(getline("."), '[a-z]*:\/\/[^ >,;]*')
  if l:uri != ""
    if has("win32")
      silent exec "!start \"".l:uri."\""
    else
      silent exec "!xdg-open '".l:uri."'"
    endif
  else
    echo "No URI found in line."
  endif
endfunction

map <Leader>lo  :call HandleURL()<cr>

command! Sel w !xsel -b

" TERMINAL OPTIONS
let &t_Co=256

" COLOR SCHEME OPTIONS
syntax enable

" COLOR SCHEME OPTIONS
syntax enable
set background=dark
let g:gruvbox_contrast_dark = "soft"
let g:material_terminal_italics = 1
let g:material_theme_style = 'darker'
colorscheme nisha


" specific term coloring
if has('unix') && has('nvim')
    hi Normal guibg=none ctermbg=none
    hi LineNr guibg=none ctermbg=none
    hi NonText guibg=none ctermbg=none
else
    hi Normal ctermbg=none
    hi LineNr ctermbg=none
    hi NonText ctermbg=none
endif

set backspace=indent,eol,start
set noerrorbells visualbell t_bv=
set laststatus=2

" Visual edition options
set virtualedit=block

" Search options
set hlsearch
set incsearch

" Column and Split options
set splitbelow
set splitright

set number
set textwidth=80
set colorcolumn=80
set nowrap


" NetRW options
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_altfile = 1
let g:netrw_winsize = 25
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'
let g:netrw_keepdir = 1
let g:netrw_preview = 1

set cpoptions+=$
set t_vb=

" Unfold by default
set nofoldenable

" Tab completion for help
set wildmenu

" Terminal parameters
if !has('nvim')
" Cursor style
    if &term!~ 'xterm'
    endif
    " Mouse support in Terminal Vim
    set ttymouse=xterm2
endif

if !has('gui_running') && !has('nvim')
    set mouse=
endif

if has('nvim')
    " set mouse=a
    set inccommand=nosplit
    "set completeopt=menuone,preview,noselect
    set completeopt=menuone,preview
endif

" Custom tabs option
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
