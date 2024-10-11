local usr_cmd = vim.api.nvim_create_user_command

-- ------------------------------------------------
-- User commands
-- ------------------------------------------------
usr_cmd("UnixLines", ":%s/\r//g | :w",
    { bang = true, desc = "convert windows carriage returns" })

usr_cmd("BC", ":bp | sp | bn | bd",
    { bang = true, desc = "close buffer without scrambling layout" })

usr_cmd("InsertSHA16", ":r! head /dev/urandom | tr -dc A-Za-z0-9 | head -c 16",
    { bang = true })
