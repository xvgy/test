"=======================================================
"===                INTERFACE OPTIONS                ===
"=======================================================

" TERMINAL OPTIONS
let &t_Co=256

" COLOR SCHEME OPTIONS
set termguicolors " This is needed if your terminal supports true colors
syntax enable
set background=dark
let g:gruvbox_contrast_dark = "soft"
let g:material_terminal_italics = 1
let g:material_theme_style = 'darker'
colorscheme nisha


if has('win32')
    let s:fontsize = 11
    function! SetupGuiFont()
        :execute "GuiFont! SauceCodePro Nerd Font:h" . s:fontsize
    endfunc
    function! AdjustFontSize(amount)
      let s:fontsize = s:fontsize+a:amount
      :execute "GuiFont! SauceCodePro Nerd Font:h" . s:fontsize
    endfunction

    noremap <C-ScrollWheelUp> :call AdjustFontSize(1)<CR>
    noremap <C-ScrollWheelDown> :call AdjustFontSize(-1)<CR>
    inoremap <C-ScrollWheelUp> <Esc>:call AdjustFontSize(1)<CR>a
    inoremap <C-ScrollWheelDown> <Esc>:call AdjustFontSize(-1)<CR>a
    autocmd! VimEnter * call SetupGuiFont()

    function SetupGuiTabline()
        "TODO: Voir si exists est actif après le startup ou non
        if exists('g:GuiLoaded')
            :execute 'GuiTabline 0'
        endif
    endfunc

    autocmd VimEnter * call SetupGuiTabline()
endif

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

" Lightline options
let g:lightline = { 'colorscheme': 'material_vim' }

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

function! s:ConcealTodoCheckboxes()
    if exists("b:todo_cchar")
        return
    endif
    " Custom conceal
    syntax match Normal "\[\ \]" conceal cchar=
    syntax match Normal "\[x\]" conceal cchar=

    let b:todo_cchar = 1
    hi Conceal guibg=NONE
    setlocal cole=1
endfunc

autocmd BufEnter,WinEnter * call s:ConcealTodoCheckboxes()
