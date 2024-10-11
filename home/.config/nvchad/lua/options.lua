require("nvchad.options")

local o = vim.o

-- text between [[]] (lua string literal) for running vanilla vim commands
vim.cmd([[ filetype on ]])
vim.cmd([[ filetype plugin on ]])
vim.cmd([[ filetype indent on ]])

o.clipboard = "unnamedplus"
-- Indenting
o.shiftwidth = 4
o.tabstop = 4
o.softtabstop = 4
o.expandtab = true
o.cursorlineopt = "both" -- enable cursorline

o.backupcopy = "yes"
o.autoread = true
o.hidden = true
o.undofile = true

o.laststatus = 2
-- o.backspace = "indent,eol,start"

o.textwidth = 80
o.colorcolumn = "80"
o.wrap = false

o.hlsearch = true
o.incsearch = true

o.foldenable = false
o.wildmenu = true
o.inccommand = "split"
-- o.completeopt = "menu,menuone,noinsert,noselect"
o.completeopt = "menuone,preview"

o.wrap = false
o.virtualedit = "block"
o.scrolloff = 100
o.number = false
o.relativenumber = false
o.ignorecase = true
o.termguicolors = true
o.autochdir = true
o.whichwrap = "b,s"
