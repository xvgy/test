local lint = require("lint")

lint.linters_by_ft = {
    lua = { "luacheck" },
    c = { "cpplint" },
}

lint.linters.luacheck.args = {
    "--globals",
    "love",
    "vim",
    "--formatter",
    "plain",
    "--codes",
    "--ranges",
    "-",
}

-- lint.linters.cpplint.args = {

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
    callback = function()
        lint.try_lint()
    end,
})
