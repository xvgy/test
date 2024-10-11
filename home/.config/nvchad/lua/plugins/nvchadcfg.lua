return {

    {
        "nvim-tree/nvim-tree.lua",
        event = "VeryLazy",
        opts = require("nvchadcfg.nvimtree")
    },
    {
        "williamboman/mason.nvim",
        opts = { PATH = "append" },
    },
}
