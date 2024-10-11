require("nvchad.autocmds")

local autocmd = vim.api.nvim_create_autocmd

autocmd({ "BufNewFile", "BufRead" }, {
    pattern = { "*.c", "*.cpp" },
    callback = function()
        vim.keymap.set("n", "gS", ":e ../src/", { noremap = true, desc = "browse project sources" })
        vim.keymap.set("n", "gI", ":e ../include/", { noremap = true, desc = "browse project includes" })
        vim.cmd.setfiletype("c")
    end,
})

autocmd({ "BufNewFile", "BufRead" }, {
    pattern = { "*.h" },
    callback = function()
        vim.cmd.setfiletype("c")
    end,
})

autocmd({ "Filetype", "BufNewFile", "BufRead" }, {
    pattern = { "Makefile" },
    callback = function()
        --                               shiftwidth=
        vim.cmd([[ setlocal ts=8 sw=8 sts=0 noet ai ]])
        --                         tabstop=      softtabstop=
    end,
})

autocmd({ "Filetype", "BufNewFile", "BufRead" }, {
    pattern = { "*.c", "*.cpp", "*.sh", "*.py", "*.php", "*.lua", "*.yaml", "*.html", "*.js", "*.css" },
    callback = function()
        --                                        expandtab= autoindent=
        vim.cmd([[ setlocal ts=4 sw=4 sts=4 et ai ]])
    end,
})
