"=======================================================
"===           TERMINAL COMMANDS OPTIONS             ===
"=======================================================

if has ('nvim')
    set splitbelow
    set splitright
    tnoremap <ESC> <C-\><C-n>:buffer #<CR>
    tnoremap <C-q> <C-\><C-n>:buffer #<CR>
    tnoremap <C-w>h <C-\><C-n><C-w>h
    tnoremap <C-w>j <C-\><C-n><C-w>j
    tnoremap <C-w>k <C-\><C-n><C-w>k
    tnoremap <C-w>l <C-\><C-n><C-w>l
    tnoremap <silent> <C-W>o <C-\><C-n><C-w>:ZoomToggle<CR>i
    tnoremap <C-W><C-E> <C-\><C-n><C-W>:WinResizerStartResize<CR>
    function! s:NVIMTerm()
        tnoremap <ESC> <C-\><C-n>:q<CR>
        tnoremap <C-q> <C-\><C-n>:q<CR>
        :split | resize 10 | terminal
    endfunc
    command! NVIMTerm call s:NVIMTerm()
    autocmd TermOpen * startinsert
    autocmd TermLeave * stopinsert
    autocmd VimEnter * nnoremap <C-w><C-j> :NVIMTerm<CR>
endif
