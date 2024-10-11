local config = {
    ensure_installed = {
        "bash",
        "c",
        "cpp",
        "lua",
        "luadoc",
        "make",
        "markdown",
        "printf",
        "vim",
        "vimdoc",
        "yaml",
    },

    auto_install = true,

    highlight = {
        enable = true,
        use_languagetree = true,
    },

    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "vm",
            node_incremental = "vn",
            node_decremental = "vp",
            scope_incremental = "vs",
        },
    },

    indent = { enable = true },
}

require("nvim-treesitter.configs").setup(config)
