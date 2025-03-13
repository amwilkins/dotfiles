-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- term colors
vim.opt.termguicolors = true

vim.g.autoformat = true

-- spell check
vim.opt.spelllang = "en_us"
vim.opt.spell = true

-- don't change tabs to spaces
vim.opt.expandtab = false

-- file picker
vim.g.lazyvim_picker = "fzf"

-- allow escape from terminal insert mode
vim.cmd([[:tnoremap <Esc> <C-\><C-n> ]])

vim.opt.clipboard = "unnamedplus"
