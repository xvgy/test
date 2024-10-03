"=======================================================
"===                VIM SYNTAX OPTIONS               ===
"=======================================================
set statusline+=%#warningmsg#
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn

autocmd Filetype lisp setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab autoindent
