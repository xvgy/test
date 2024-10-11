local rainbow_delimiters = require("rainbow-delimiters")

vim.cmd([[ highlight RainbowDelimiterRed guifg=#68a0b0 ctermfg=White ]])
vim.cmd([[ highlight RainbowDelimiterYellow guifg=#946EaD ctermfg=White ]])
vim.cmd([[ highlight RainbowDelimiterBlue guifg=#c7aA6D ctermfg=White ]])
vim.cmd([[ highlight RainbowDelimiterOrange guifg=#68a0b0 ctermfg=White ]])
vim.cmd([[ highlight RainbowDelimiterGreen guifg=#946EaD ctermfg=White ]])
vim.cmd([[ highlight RainbowDelimiterViolet guifg=#c7aA6D ctermfg=White ]])
vim.cmd([[ highlight RainbowDelimiterCyan guifg=#68a0b0 ctermfg=White ]])

vim.g.rainbow_delimiters = {
    strategy = {
        [''] = rainbow_delimiters.strategy['global'],
        vim = rainbow_delimiters.strategy['local'],
    },
    query = {
        [''] = 'rainbow-delimiters',
        lua = 'rainbow-blocks',
    },
    priority = {
        [''] = 110,
        lua = 210,
    },
    highlight = {
        'RainbowDelimiterRed',
        'RainbowDelimiterYellow',
        'RainbowDelimiterBlue',
        'RainbowDelimiterOrange',
        'RainbowDelimiterGreen',
        'RainbowDelimiterViolet',
        'RainbowDelimiterCyan',
    },
}
