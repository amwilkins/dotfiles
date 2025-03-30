-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Telekasten keymaps
-- Launch panel if nothing is typed after <leader>z
vim.keymap.set("n", "<leader>z", "<cmd>Telekasten panel<CR>")
vim.keymap.set("n", "<leader>zf", "<cmd>Telekasten find_notes<CR>")
vim.keymap.set("n", "<leader>zg", "<cmd>Telekasten search_notes<CR>")
vim.keymap.set("n", "<leader>zd", "<cmd>Telekasten goto_today<CR>")
vim.keymap.set("n", "<leader>zz", "<cmd>Telekasten follow_link<CR>")
vim.keymap.set("n", "<leader>zn", "<cmd>Telekasten new_note<CR>")
vim.keymap.set("n", "<leader>zc", "<cmd>Telekasten show_calendar<CR>")
vim.keymap.set("n", "<leader>zb", "<cmd>Telekasten show_backlinks<CR>")
vim.keymap.set("n", "<leader>zI", "<cmd>Telekasten insert_img_link<CR>")
vim.keymap.set("n", "<leader>zx", "<cmd>Telekasten toggle_todo<CR>")
vim.keymap.set("n", "<leader>zt", "<cmd>Telekasten show_tags<CR>")
vim.keymap.set("n", "<leader>#", "<cmd>Telekasten show_tags<CR>")
vim.keymap.set("i", "[[", "<cmd>Telekasten insert_link<CR>")

-- Insert datetime with <F5>
vim.keymap.set("i", "<F5>", "<C-R>=strftime('%Y-%m-%d %R')<CR>")
vim.keymap.set("i", "<F4>", "<C-R>=strftime('%Y-%m-%d')<CR>")

-- scroll screen without moving cursor
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-e>", "j<C-e>")
vim.keymap.set("n", "<C-y>", "k<C-y>")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
-- vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
-- vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")

-- move up/down window
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-j>", "<C-w>j")

-- visual mode, print without overwriting the system clipboard
vim.keymap.set("x", "p", [["_dP]])

-- -- Switch colorscheme
vim.keymap.set("n", "<leader>tt", "<cmd>Themery<CR>")

-- apply first spelling suggestion
vim.keymap.set("n", "z1", "z=1", { desc = "Fix Spelling" })

-- -- Copy from visual mode.
-- vim.keymap.set("v", "<D-c>", '"+y')
-- -- Paste in normal or in visual (to replace selection).
-- vim.keymap.set({ "n", "v" }, "<D-v>", '"+p')
-- -- Paste clipboard at cursor position from insert mode.
-- vim.keymap.set("i", "<D-v>", "<C-r>+")
