"=======================================================
"===             ADDONS/PLUGINS OPTIONS              ===
"=======================================================


"========================================================
"===>  'junegunn/goyo'
"========================================================
function! s:goyo_enter()
    set wrap
endfunction

function! s:goyo_leave()
    set nowrap
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()


"========================================================
"===> 'scrooloose/nerdtree'
"========================================================
let NERDTreeIgnore = ['\.o$', '\.a$']
let g:NERDTreeWinPos = "right"
let NERDTreeQuitOnOpen = 0      "Conflict avec ma commande
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ "Modified"  : "",
    \ "Staged"    : "",
    \ "Untracked" : "",
    \ "Renamed"   : "",
    \ "Unmerged"  : "",
    \ "Deleted"   : "",
    \ "Dirty"     : "",
    \ "Clean"     : "",
    \ 'Ignored'   : '',
    \ "Unknown"   : "?"
    \ }


"========================================================
"===> 'scrooloose/nerdcommenter'
"========================================================
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDAltDelims_c = 1
let g:NERDTrimTrailingWhitespace = 1


"========================================================
"===>  'junegunn/seoul256'
"========================================================
let g:seoul256_background = 236



"========================================================
"===>   'dhruvasagar/vim-table-mode'
"========================================================
let g:table_mode_corner_corner='+'
"let g:table_mode_corner_corner='|'
let g:table_mode_header_fillchar='-'


"========================================================
"===>  'nathanaelkane/vim-indent-guides'
"========================================================
let g:indent_guides_enable_on_vim_startup = 1

"========================================================
"===>  'airblade/vim-gitgutter'
"========================================================
let g:gitgutter_max_signs = 500
let g:gitgutter_async = 1
if has("win32") || has("win64")
    let g:gitgutter_git_executable = 'C:\Program Files\Git\bin\git.exe'
endif


"========================================================
"===>  'airblade/vim-airline'
"========================================================
let g:airline_theme='nisha'
let g:airline_powerline_fonts = 0 

" Extensions
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'

let g:airline#extensions#coc#enabled = 1
" let g:airline#extensions#ale#enabled = 1
" let g:airline#extensions#syntastic#enabled = 1
let g:airline_highlighting_cache = 1


"========================================================
"===>  coc/nvim
"========================================================
"function! s:check_back_space() abort
"  let col = col('.') - 1
"  return !col || getline('.')[col - 1]  =~# '\s'
"endfunction
"
"" Use <c-space> to trigger completion.
"inoremap <silent><expr> <c-space> coc#refresh()
"
"" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
"" Coc only does snippet and additional edit on confirm.
"inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
"let g:coc_disable_startup_warning = 1


"========================================================
"===>   'dhruvasagar/vim-dotoo'
"========================================================
" dotoo plugin might be immune to the aucmds
"autocmd BufEnter dotoocapture, dotooagenda setl
"    \   noswapfile noundofile nobackup viminfo= bkc=no
"autocmd BufReadPre,FileReadPre,BufNewFile *.dotoo,*.org setl
"    \   noswapfile noundofile nobackup viminfo= bkc=no
"autocmd BufReadPre,FileReadPre,BufNewFile *.org set filetype=dotoo

"let g:dotoo#capture#clock = 0

"autocmd BufReadPre,FileReadPre,BufNewFile *.sc setl
"    \   noswapfile undodir= noundofile nobackup viminfo
"    \   bufhidden=delete bkc=no nobw bdir= dir=
"autocmd BufLeave *.sc :SetSessionDirs

"========================================================
"===>  [vim-dotoo IOSEVKA FONT -DEBUG] (disabled)
"========================================================
"function! s:DotooCaptureTop()
"    set nosplitbelow
"    call dotoo#capture#capture()
"    set splitbelow
"endfunc
"
"function! s:DotooAgendaTop()
"    set nosplitbelow
"    call dotoo#agenda#agenda()
"    set splitbelow
"endfunc

"========================================================
"===>  Dotoo Multi-Agenda (disabled)
"========================================================
" let s:dotoo_def = '~/.org/dotoo'
" let s:dotoo_bas = '~/org/dotoo'
" function! s:DotooSetDefaultRef()
"     let g:dotoo#agenda#files = [ s:dotoo_bas . '/*.*' ]
"     let g:dotoo#capture#refile = expand(s:dotoo_def . '/@inbox.dotoo')
" endfunc
" function! s:DotooSetBaseRef()
"     let g:dotoo#agenda#files = [ s:dotoo_def . '/*.*' ]
"     let g:dotoo#capture#refile = expand(s:dotoo_bas . '/@inbox.org')
" endfunc
" 
" function! s:DotooBaseAgenda()
"     call s:DotooSetBaseRef()
"     call s:DotooAgendaTop()
" endfunc
" 
" function! s:DotooDefaultAgenda()
"     call s:DotooSetDefaultRef()
"     call s:DotooAgendaTop()
" endfunc
" 
" function! s:DotooBaseCapture()
"     call s:DotooSetBaseRef()
"     call s:DotooCaptureTop()
" endfunc
" 
" function! s:DotooDefaultCapture()
"     call s:DotooSetDefaultRef()
"     call s:DotooAgendaTop()
" endfunc
" 
" command! DotooBaseAgenda call s:DotooBaseAgenda()
" command! DotooBaseCapture call s:DotooBaseCapture()
" command! DotooDefaultAgenda call s:DotooDefaultAgenda()
" command! DotooDefaultCapture call s:DotooDefaultCapture()
" 
" function! s:DotooRemapNarrowFontFix()
"     nunmap gC
"     nunmap gA
"     nmap gA :DotooBaseAgenda<CR>
"     nmap gC :DotooBaseCapture<CR>
"     nmap gPA :DotooDefaultAgenda<CR>
"     nmap gPC :DotooDefaultCapture<CR>
" endfunc
" 
" autocmd VimEnter * call s:DotooRemapNarrowFontFix()

"========================================================
"===> 'mhinz/vim-startify'
"========================================================
let g:startify_skiplist = []



"========================================================
"===>  'pechorin/any-jump.vim'
"========================================================
" Show line numbers in search results
let g:any_jump_list_numbers = 1

" Auto search references
let g:any_jump_references_enabled = 1

" Auto group results by filename
let g:any_jump_grouping_enabled = 1

" Amount of preview lines for each search result
let g:any_jump_preview_lines_count = 5

" Max search results, other results can be opened via [a]
let g:any_jump_max_search_results = 10

" Prefered search engine: rg or ag
let g:any_jump_search_prefered_engine = 'rg'


" Search results list styles:
" - 'filename_first'
" - 'filename_last'
let g:any_jump_results_ui_style = 'filename_first'

" Any-jump window size & position options
let g:any_jump_window_width_ratio  = 0.6
let g:any_jump_window_height_ratio = 0.6
let g:any_jump_window_top_offset   = 4

" Customize any-jump colors with extending default color scheme:
let g:any_jump_colors = { "help": "Comment" }

" Or override all default colors
let g:any_jump_colors = {
      \"plain_text":         "Comment",
      \"preview":            "Comment",
      \"preview_keyword":    "Operator",
      \"heading_text":       "Function",
      \"heading_keyword":    "Identifier",
      \"group_text":         "Comment",
      \"group_name":         "Function",
      \"more_button":        "Operator",
      \"more_explain":       "Comment",
      \"result_line_number": "Comment",
      \"result_text":        "Statement",
      \"result_path":        "String",
      \"help":               "Comment"
      \}

" Disable default any-jump keybindings (default: 0)
let g:any_jump_disable_default_keybindings = 1

" Remove comments line from search results (default: 1)
let g:any_jump_remove_comments_from_results = 1

" Custom ignore files
" default is: ['*.tmp', '*.temp']
let g:any_jump_ignored_files = ['*.tmp', '*.temp']

" Search references only for current file type
" (default: false, so will find keyword in all filetypes)
let g:any_jump_references_only_for_current_filetype = 0

" Disable search engine ignore vcs untracked files
" (default: false, search engine will ignore vcs untracked files)
let g:any_jump_disable_vcs_ignore = 0

function! s:AnyJumpLoadKeys()
    " Normal mode: Jump to definition under cursore
    nnoremap <Leader>z :AnyJump<CR>

    " Visual mode: jump to selected text in visual mode
    xnoremap <Leader>z :AnyJumpVisual<CR>

    " Normal mode: open previous opened file (after jump)
    nnoremap <Leader>ds :AnyJumpBack<CR>

    " Normal mode: open last closed search window again
    nnoremap <Leader>dl :AnyJumpLastResults<CR>
endfunc

autocmd VimEnter * call s:AnyJumpLoadKeys()
