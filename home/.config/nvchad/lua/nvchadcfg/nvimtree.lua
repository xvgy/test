local redef_attach = function(bufnr)
    local api = require("nvim-tree.api")

    local opts = function(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end
    api.config.mappings.default_on_attach(bufnr)
    vim.keymap.set('n', 'u', api.tree.change_root_to_parent, opts('Up'))
end

local opts = {
    on_attach = redef_attach,
    sync_root_with_cwd = true,
    respect_buf_cwd = true,
    reload_on_bufenter = true,
    actions = {
        open_file = { quit_on_open = false },
        change_dir = { global = true },
    },
    update_focused_file = {
        enable = true,
        update_root = true,
    },
    view = {
        width = 26,
        preserve_window_proportions = true,
    },
}

return opts
