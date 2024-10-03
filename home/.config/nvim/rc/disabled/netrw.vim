"NetRW mappings

let g:netw_root = ""

fun! LexToggle(dir)
    if exists("t:lex_buf_nr")
        call LexClose()
    else
        call LexOpen(a:dir)
    endif
endf

fun! LexOpen(dir)
    let g:netw_browse_split=4
    let lex_width = 25

    execute "Lexplore" . a:dir
    let t:lex_buf_nr = bufnr("%")
    wincmd H

    call LexSize(lex_width)
endf

fun! LexClose()
    let cur_win_nr = winnr()
    let target_nr = (cur_win_nr == 1 ? winnr("#") : cur_win_nr )

    1wincmd w
    close
    unlet t:lex_buf_nr

    execute (target_nr - 1) . "wincmd w"
    call NormalizeWidths()
endf

fun! LexSize(lex_width)
    execute "vertical resize" . a:lex_width
    set winfixwidth
    call NormalizeWidths()
endf

fun! NormalizeWidths()
    let eadir_pref = &eadirection
    set eadirection=hor
    set equalalways! equalalways!
    let &eadirection = eadir_pref
endf

augroup NetrwGroup
    autocmd! BufEnter * call NormalizeWidths()
augroup END

noremap <silent>;m :call LexToggle(getcwd())<CR>
noremap <silent>;n :call LexToggle("")<CR>
