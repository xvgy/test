return {

    { -- Addons
        "NStefan002/visual-surround.nvim",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("addons.visual-surround")
        end
    },
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        event = "VimEnter",
        config = function()
            require("addons.todo-comments")
        end
    },
    {
        "brenoprata10/nvim-highlight-colors",
        event = "VeryLazy",
        config = function()
            require("addons.nvim-highlight-colors")
        end
    },
    {
        "hiphish/rainbow-delimiters.nvim",
        event = { "BufReadPost", "BufNewFile", "BufWritePre", "VeryLazy" },
        config = function()
            require("addons.rainbow-delimiters")
        end
    }
}
