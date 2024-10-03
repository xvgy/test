"=======================================================
"===                CODING STYLE OPTIONS             ===
"=======================================================

filetype on
filetype plugin on
filetype indent on

" Extension parameters
autocmd BufNewFile,BufRead *.h set filetype=c

" 2017 indent rules
"autocmd Filetype c,make,sh setlocal ts=8 sw=8 sts=0 noexpandtab

" 2018 New indent rules
autocmd Filetype make setlocal ts=8 sw=8 sts=0 noexpandtab autoindent
autocmd Filetype c,sh,cpp,py,php,rb setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab autoindent
autocmd Filetype xml setlocal ts=8 sw=8 sts=0 noexpandtab
