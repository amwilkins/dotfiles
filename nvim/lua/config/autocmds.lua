-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- recognize anything that starts with Dockerfile_
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
    pattern = "Dockerfile_*",
    command = "LspStart dockerls",
})

-- Open help window in a vertical split to the right.
vim.api.nvim_create_autocmd("BufWinEnter", {
    group = vim.api.nvim_create_augroup("help_window_right", {}),
    pattern = { "*.txt" },
    callback = function()
        if vim.o.filetype == "help" then
            vim.cmd.wincmd("L")
            vim.cmd("vertical resize 80")
        end
    end,
})
