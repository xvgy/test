-- stylua: ignore
require("nvchad.mappings")

local map = vim.keymap.set
local umap = vim.keymap.del

-- ------------------------------------------------
-- Unmap normal
-- ------------------------------------------------
umap("n", "<C-n>")
-- -------------
-- Map normal
-- -------------
-- map("n", ";", ":", { desc = "CMD enter command mode" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

map("n", "<Leader>:", ":nohlsearch<cr>",
    { noremap = true, desc = "clear highlight(s)" })

map("n", "<Leader>e", ":NvimTreeToggle<cr>",
    { noremap = true, desc = "toggle nvimtree" })

map("n", "<Leader>ar", ":e " .. vim.fn.stdpath("config") .. "/<cr>",
    { noremap = true, desc = "open nvim config dir" })

-- map("n", "<Leader>as", ":e snippets", { noremap = true })
--
map("n", "<Leader>sa", ":so %<cr>",
    { noremap = true, desc = "source current buffer" })

map("n", "<Leader>S", ":%s/",
    { noremap = true, desc = "find in buffer" })

map("v", "<Leader>S", ":s/",
    { noremap = true, desc = "find in v-range" })

map("n", "<Leader>wp", function() -- Old :WP function + command as a direct keymap instead
        if vim.t.see_whitespace == 1 then
            vim.t.see_whitespace = 0
            vim.cmd.set("list&")
            print("Whitespace indicators disabled.")
        else
            vim.t.see_whitespace = 1
            vim.cmd.set("list")
            print("Whitespace indicators enabled.")
        end
    end,
    { noremap = true, expr = true, desc = "toggle whitespace visibility" })

map("n", "<Leader>n", function()
        if vim.o.number ~= true then
            vim.o.number = true
            vim.o.relativenumber = true
            print("Enabled line num.")
        else
            vim.o.number = false
            vim.o.relativenumber = false
            print("Disabled line num.")
        end
        vim.api.nvim_feedkeys("kj", "n", false)
    end,
    { noremap = true, expr = true, desc = "toggle line numbers" })

map("n", "<Leader>z", function()
        if vim.o.scrolloff == 0 then
            vim.o.scrolloff = 100
            vim.api.nvim_feedkeys("kj", "n", false)
            print("Enabled scope focus.")
        else
            vim.o.scrolloff = 0
            print("Disabled scope focus.")
        end
    end,
    { noremap = true, expr = true, desc = "toggle linenum" })


map("n", "tg", "gT", { desc = "cycle tabs backwards" }) -- Alternative for tab switching

map({ "n", "i", "v" }, "<C-g>", ":tabe <cfile><cr>",
    { noremap = true, desc = "open link in new tab" })
-- ------------------------------------------------
-- Unmap insert
-- ------------------------------------------------
umap("i", "<C-h>")
umap("i", "<C-j>")
umap("i", "<C-k>")
umap("i", "<C-l>")
-- -------------
-- Map insert
-- -------------
map("i", "<C-j>", function()
    local c = vim.fn.col(".")
    return ((c == 1 or c == vim.fn.col("$")) and "<ESC>" or "<ESC>l")
end, { expr = true })

map("i", "<M-h>", "<Left>")
map("i", "<M-j>", "<Down>")
map("i", "<M-k>", "<Up>")
map("i", "<M-l>", "<Right>")
