-- 25ms start time
local config = {
    signs = true,      -- show icons in the signs column
    sign_priority = 8, -- sign priority, default: 8
    -- list of named colors as hex
    colors = {
        pink       = { "#EE7799" },
        red        = { "#FF2244" },
        deepred    = { "#BB3333" },
        darkred    = { "#AA2211" },
        orangered  = { "#FD5344" },
        orange     = { "#FF7711" },
        canary     = { "#FFCC55" },
        cleargreen = { "#57D099" },
        turquoise  = { "#22BBDD" },
        clearblue  = { "#67AEFF" },
        cleargray  = { "#DDDDDD" },
    },
    -- keywords recognized as todo comments
    -- general keywords
    keywords = {
        MUST      = { icon = " ", color = "deepred", alt = { "PRIO" }, },
        TODO      = { icon = "o ", color = "orangered", alt = { "SHOULD" }, }, -- overrides default TODO
        DOING     = { icon = "> ", color = "clearblue", alt = { "NOW" } },
        NEXT      = { icon = ">>", color = "red", alt = {} },
        REDO      = { icon = "~ ", color = "darkred", alt = {} },
        COULD     = { icon = " ", color = "pink", alt = { "MAYBE", "CAN" } },
        SOON      = { icon = " ", color = "turquoise", alt = {} },
        DONE      = { icon = " ", color = "cleargreen", alt = { "OVER" } },
        CANC      = { icon = "X ", color = "darkred", alt = { "CANCELLED", "CANCEL", "CANNOT", "DROPPED", "DROP" } },
        NOTE      = { icon = " ", color = "canary", alt = { "INFO", "REF" } },
        -- workflow keywords
        TOFIX     = { icon = " ", color = "orange", alt = { "TOADD", "TOREM", "TOMOD", "TOREFA" } },
        TOFIXASAP = { icon = "!!", color = "red", alt = {} },
        DIFF      = { icon = " ★", color = "canary", alt = {} },
        ADD       = { icon = " +", color = "cleargreen", alt = { "ADDED" } },
        REM       = { icon = " -", color = "deepred", alt = { "REMOVED", "DEL", "DELETED" } },
        MOD       = { icon = " ~", color = "orangered", alt = { "MODIFIED" } },
        REFA      = { icon = " ^", color = "cleargray", alt = { "REFACTOR" } },
    },
    gui_style = {
        fg = "NONE",       -- The gui style to use for the fg highlight group.
        bg = "BOLD",       -- The gui style to use for the bg highlight group.
    },
    merge_keywords = true, -- when true, custom keywords will be merged with the defaults
    -- highlighting of the line containing the todo comment
    -- * before: highlights before the keyword (typically comment characters)
    -- * keyword: highlights of the keyword
    -- * after: highlights after the keyword (todo text)
    highlight = {
        multiline = true,              -- enable multiline todo comments
        multiline_pattern = "^.",      -- lua pattern to match the next multiline from the start of the matched keyword
        multiline_context = 10,        -- extra lines that will be re-evaluated when changing a line
        before = "",                   -- "fg" or "bg" or empty
        keyword = "wide",              -- "fg", "bg", "wide", "wide_bg", "wide_fg" or empty. (wide and wide_bg is the same as bg, but will also highlight surrounding characters, wide_fg acts accordingly but with fg)
        after = "fg",                  -- "fg" or "bg" or empty
        -- pattern = [[.*<(KEYWORDS)\s*:]], -- original
        pattern = [[.*<(KEYWORDS)\s]], -- pattern or table of patterns, used for highlighting (vim regex)
        comments_only = true,          -- uses treesitter to match keywords in comments only
        max_line_len = 180,            -- ignore lines longer than this
        exclude = {},                  -- list of file types to exclude highlighting
    },
    search = {
        command = "rg",
        args = { "--color=never", "--no-heading", "--with-filename", "--line-number", "--column", },
        -- regex that will be used to match keywords.
        -- don't replace the (KEYWORDS) placeholder
        -- pattern = [[\b(KEYWORDS):]], -- original
        pattern = [[\b(KEYWORDS)\s]], -- ripgrep regex
    },
}

vim.api.nvim_create_user_command("TodoTelescope2", function(input)
        local target_dir = vim.fn.getcwd()
        local keywords_cmd = ""

        if input.fargs[1] ~= "none" then
            keywords_cmd = " keywords=" .. string.upper(input.fargs[1])
        end
        if #input.fargs == 2 then
            target_dir = vim.fn.resolve(target_dir .. "/" .. input.fargs[2])
        end
        vim.cmd("TodoTelescope" .. keywords_cmd .. " cwd=" .. target_dir)
    end,
    { bang = true, nargs = "+", complete = "dir" })

vim.api.nvim_create_user_command("TodoTelescopeT", function(input)
        local target_dir = vim.fn.getcwd()
        local predef_keys =
            "MUST,PRIO,TODO,SHOULD,DOING,NOW,NEXT,REDO,"
            .. "COULD,MAYBE,CAN,SOON,DONE,OVER,CANC,CANCELLED,"
            .. "CANCEL,CANNOT,DROPPED,DROP,NOTE,INFO,REF"

        if input.args == "" then
            vim.cmd("TodoTelescope keywords=" .. predef_keys .. " cwd=" .. target_dir)
            return
        end
        target_dir = vim.fn.resolve(target_dir .. "/" .. input.fargs[2])
        vim.cmd("TodoTelescope keywords=" .. predef_keys .. " cwd=" .. target_dir)
    end,
    { bang = true, nargs = "?", complete = "dir" })

vim.api.nvim_create_user_command("TodoTelescopeG", function(input)
        local target_dir = vim.fn.getcwd()
        local predef_keys =
            "TOFIX,TOADD,TOREM,TOMOD,TOREFA,TOFIXASAP,DIFF,ADD,ADDED,"
            .. "REM,REMOVED,DEL,DELETED,MOD,MODIFIED,REFA,REFACTOR"

        if input.args == "" then
            vim.cmd("TodoTelescope keywords=" .. predef_keys .. " cwd=" .. target_dir)
            return
        end
        target_dir = vim.fn.resolve(target_dir .. "/" .. input.fargs[2])
        vim.cmd("TodoTelescope keywords=" .. predef_keys .. " cwd=" .. target_dir)
    end,
    { bang = true, nargs = "?", complete = "dir" })

vim.keymap.set("n", "<Leader>@@", function() return ":TodoTelescope2 none " end,
    { expr = true, desc = "prompt todo-comments telescope all" })

vim.keymap.set("n", "<Leader>@t", function() return ":TodoTelescopeT " end,
    { expr = true, desc = "prompt todo-comments telescope tasks" })

vim.keymap.set("n", "<Leader>@g", function() return ":TodoTelescopeG " end,
    { expr = true, desc = "prompt todo-comments telescope git" })

local matchext = function(fname, ext)
    return (string.match(fname, '%.' .. ext .. '$') ~= nil)
end

-- https://github.com/folke/todo-comments.nvim/issues/264
vim.api.nvim_create_autocmd({ 'VimEnter', 'BufEnter' }, {
    desc = 'Enable todo-comments for text',
    group = vim.api.nvim_create_augroup('user.todo.text', { clear = true }),
    callback = function(ev)
        local config = require('todo-comments.config')
        local sm = function(ext)
            return not matchext(ev.file, ext)
        end
        local cmrules =
            sm('md') and sm('txt') and
            sm('adoc') and sm('asciidoc')
        config.options.highlight.comments_only = cmrules
    end,
})

require("todo-comments").setup(config)
