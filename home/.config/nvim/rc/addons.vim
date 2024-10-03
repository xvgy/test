"=======================================================
"===                 ADDONS/PLUGINS                  ===
"=======================================================

set nocompatible              " be iMproved, required
set encoding=UTF-8            " encoding settings
filetype off                  " required
filetype plugin indent on
syntax on

augroup sourcefiles
    autocmd BufNewFile,BufRead *.md,*.rmd,*.markdown setf pandoc
augroup END


call plug#begin('~/.cache/nvim/plugged')

Plug 'LnL7/vim-nix'
"========================================================
"===>  Dependencies
"========================================================
Plug 'tomtom/tlib_vim'                      "SnipMate dependency
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'equalsraf/neovim-gui-shim'            "Windows NVIM-qt fix
"========================================================
"===>  Bare minimal
"========================================================
Plug 'tpope/vim-surround'   
Plug 'tpope/vim-repeat'
Plug 'simeji/winresizer'                    "Resize splits
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-abolish'
"========================================================
"===>  Essentials
"========================================================
" Plug 'dhruvasagar/vim-dotoo'
Plug 'garbas/vim-snipmate'                  "Snippets!
"========================================================
"===>  IDE Behavior
"========================================================
"Plug 'ycm-core/YouCompleteMe'              "Language completion framework
Plug 'metakirby5/codi.vim'
"Plug 'neoclide/coc.nvim',  {'branch': 'release'} "CocInstall coc-vimlsp coc-tsserver
Plug 'skywind3000/asyncrun.vim'             "Async runner
" Plug 'dense-analysis/ale'
Plug 'pechorin/any-jump.vim'
Plug 'tpope/vim-dadbod'
"========================================================
"===>  Interface / QoL
"========================================================
Plug 'mhinz/vim-startify'
Plug 'scrooloose/nerdtree'                  "File management
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'               "Git diff gutter
Plug 'ryanoasis/vim-devicons'               "Icons on vim's filebar
Plug 'christoomey/vim-tmux-navigator'       "Tmux navigator
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jiangmiao/auto-pairs'                 "Auto-close brackets
Plug 'junegunn/goyo.vim'                    "Distraction-Free mode
Plug 'xtal8/traces.vim'                     "Highlights ranges for Ex (Vim only)
Plug 'godlygeek/tabular'                    "Markdown
Plug 'nathanaelkane/vim-indent-guides'      "Indent guides
Plug 'jamessan/vim-gnupg'
Plug 'jremmen/vim-ripgrep'
"========================================================
"===>  Control and Motions
"========================================================
Plug 'raimondi/delimitmate'
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdcommenter'             "Commentary
Plug 'dhruvasagar/vim-table-mode'
"========================================================
"===>  Syntax & Filetype enhancements
"========================================================
Plug 'aklt/plantuml-syntax'
Plug 'neovimhaskell/haskell-vim'
Plug 'ap/vim-css-color'                     "CSS Colors
Plug 'chrisbra/csv.vim'
Plug 'mattn/emmet-vim'                      "Emmet integration for HTML
Plug 'plasticboy/vim-markdown'
"Plug 'jackguo380/vim-lsp-cxx-highlight'    "DEPENDS ON coc.nvim or nvim-lsp
"========================================================
"===>  Themes
"========================================================
Plug 'ajmwagar/vim-deus'                
Plug 'mr-ubik/vim-hackerman-syntax', {'as': 'hackerman',
            \'do' : 'mkdir -p colors && mv *.vim $_'}
Plug 'junegunn/seoul256.vim'
Plug 'morhetz/gruvbox'
Plug 'flrnprz/taffy.vim'
Plug 'kaicataldo/material.vim'
Plug 'heraldofsolace/nisha-vim'


if has('nvim')
    call remove(g:plugs, 'traces.vim')
endif
if has('unix')
    call remove(g:plugs, 'neovim-gui-shim')
endif

call plug#end()