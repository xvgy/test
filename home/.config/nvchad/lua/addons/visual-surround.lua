local plugin = {
    fncall = require("visual-surround").surround,
    opts = {
        pfx = "S",
        syms = { "{", "}", "[", "]", "(", ")", "'", '"', "<", ">" }
    },
    desc = "[visual-surround] surround selection with "
}

local config = {
    use_default_keymaps = false,
}

for _, key in pairs(plugin.opts.syms) do
    vim.keymap.set("v", plugin.opts.pfx .. key, function()
        plugin.fncall(key)
    end, { desc = plugin.desc .. key })
end

require("visual-surround").setup(config)
