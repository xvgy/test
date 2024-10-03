"=======================================================
"===            GENERAL COMMAND OPTIONS              ===
"=======================================================

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

" Windows only: Copy/Paste into system's clipboard
if has("win32") || has("win64")
    vmap <C-C> "*y
    imap <C-V> <ESC>"*p`]a
endif

" Remove search highlights
nmap <Leader><space> :nohlsearch<cr>

" Access vim config files
nmap <Leader>ev :e ~/.config/nvim/vimrc<cr>
nmap <Leader>er :e ~/.config/nvim/rc/
nmap <Leader>es :e ~/.config/nvim/snippets/

" Easier sourcing
nmap <Leader>sa :so %<cr>

" Search/Replace term
nmap <Leader>s :%s/
vmap <Leader>s :s/

" Close buffer whil conserving window layout
command! BC :bp | sp | bn | bd

" Convert DOS line-endings into UNIX line-endings
command! UnixLines :%s/\r//g | :w

"========================================================
"===>  FUNCTIONS & COMMAND-MAPPING
"========================================================

" NERDTreeMapping
function! s:SNERDTreeToggle()
    if exists('g:ntt_toggled') && g:ntt_toggled
        :NERDTreeClose
        let g:ntt_toggled = 0
    else
        :NERDTreeCWD
        let g:ntt_toggled = 1
    endif
endfunc

function! s:NERDTreeToggle()
    if exists('g:ntt_toggled') && g:ntt_toggled
        let g:ntt_toggled = 0
        :NERDTreeClose
    else
        :NERDTreeFind
        let g:ntt_toggled = 1
    endif
endfunc

command! NNERDTreeToggle call s:NERDTreeToggle()
command! SNERDTreeToggle call s:SNERDTreeToggle()
nnoremap <silent><Leader>n :SNERDTreeToggle<CR>
nnoremap <silent><Leader>m :NNERDTreeToggle<CR>

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

" Insert 10 random digits and chars into buffer
function! INameHash()
    :r! head /dev/urandom | tr -dc A-Za-z0-9 | head -c 10
endfunc
command! INH call INameHash()
nmap <Leader>hh :INH<CR>

" Toggle mouse functionnality in term
function! ToggleMouse()
    if &mouse == 'a'
        set mouse=
    else
        set mouse=a
    endif
endfunc

" Zoom / Restore window.
function! s:ZoomToggle() abort
    if exists('t:zt_zoomed') && t:zt_zoomed
        execute t:zt_winrestcmd
        let t:zt_zoomed = 0
    else
        let t:zt_winrestcmd = winrestcmd()
        resize
        vertical resize
        let t:zt_zoomed = 1
    endif
endfunction
command! ZoomToggle call s:ZoomToggle()

noremap <silent> <C-W>o :ZoomToggle<CR>

" Toggle whitespace-mode
function! s:WPToggle()
    if exists('t:setlist') && t:setlist
        execute 'set list&'
        let t:setlist = 0
    else
        execute 'set list'
        let t:setlist = 1
    endif
endfunction
command! WPToggle call s:WPToggle()
nmap <Leader>wp :WPToggle<cr>

"" Fzf mappings
"nmap <Leader>ff :Files<cr>
"nmap <Leader>fa :Find<cr>
"nmap <Leader>ft :Tags<cr>
"nmap <Leader>fm :Marks<cr>
"
"" LiveDown mappings
"function! s:LivedownBegin()
"    :LivedownPreview 
"    sleep 1000m
"    :!xdg-open 'http://localhost:3000'
"endfunction
"
"function! s:LivedownRestart()
"    :LivedownKill
"    sleep 200m
"    call s:LivedownBegin()
"endfunc
"
"command! LivedownBegin call s:LivedownBegin()
"command! LivedownRestart call s:LivedownRestart()
"command! LB :LivedownBegin
"command! LR :LivedownRestart
"command! LK :LivedownKill

"" Vim-calendar / Toggle calendar + VimWiki mapping
"function! ToggleCalendar()
"    execute ":Calendar"
"    if exists("t:calendar_open")
"        if t:calendar_open == 1
"            execute "q"
"            unlet t:calendar_open
"    else
"        t:calendar_open = 1
"    end
"    else
"        let t:calendar_open = 1
"    end
"endfunction
"
"function! SafeToggleCalendar()
"    if isdirectory(expand(g:calendar_diary))
"        call ToggleCalendar()
"    else
"        echo "diary not found."
"    endif
"endfunc
"
"map <Leader>wc :call SafeToggleCalendar()<cr>
"map <Leader>wj :VimwikiMakeDiaryNote<cr>
"map <Leader>wt <Leader>ws1<cr>
"map <Leader>wx <Leader>ws2<cr>
"map <Leader>wa :WikiTodos<cr>

" YouCompleteMe mappings
"nmap <Leader>yd :YcmCompleter GoTo

command! Sel w !xsel -b

nnoremap 1tg 1gt
nnoremap 2tg 2gt
nnoremap 3tg 3gt
nnoremap 4tg 4gt
nnoremap 5tg 5gt
nnoremap 6tg 6gt
nnoremap 7tg 7gt
nnoremap 8tg 8gt
nnoremap 9tg 9gt
nnoremap gt :tabnext<CR>
nnoremap tg :tabprevious<CR>

if has('win32') || has('win64')
    nnoremap <S-tab>    :tabprevious<CR>
    inoremap <S-tab>    <ESC>:tabprevious<CR>i
    nnoremap <C-S-tab>  :tabprevious<CR>
    inoremap <C-S-tab>  <ESC>:tabprevious<CR>i
    nnoremap <C-tab>    :tabnext<CR>
    inoremap <C-tab>    <ESC>:tabnext<CR>i
endif

:map Gf :tabe <cfile><CR>

:command! -nargs=* -complete=shellcmd R new | setlocal buftype=nofile bufhidden=hide noswapfile | r !<args>

autocmd BufNewFile,BufRead *.c
    \ nmap ;q :e ../src/%<.c<CR>      |
    \ nmap ;a :e ../include/%<.h<CR>

autocmd BufNewFile,BufRead *.cpp
    \ nmap ;q :e ../src/%<.cpp<CR>      |
    \ nmap ;a :e ../include/%<.hpp<CR>

if has('unix')
    let g:netrw_browsex_viewer="exo-open"
endif

function! s:BufferAsVimL()
    :%y|@"
endfunc
command! BufferAsVimL call s:BufferAsVimL()

" Use these for a week
function! s:GenCTags()
    if has('unix')
        :silent exec "!ctags -R -h=\".c.h\" --exclude=.git --exclude=.ccls-* ."
    endif
endfunc

function! s:WSLoad()
    SLoad
    call s:GenCTags()
endfunc
command! WSLoad call s:WSLoad()

nmap <C-S-q> :WSLoad<CR>
nmap <C-S-s> :SSave 
