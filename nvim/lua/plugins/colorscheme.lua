return {
    -- Themes
    { "ellisonleao/gruvbox.nvim" },
    { "gmr458/vscode_modern_theme.nvim" },
    { "olimorris/onedarkpro.nvim",
       priority = 1000, -- Ensure it loads first 
    },

    -- Chosen Theme
    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "vscode_modern",
        },
    },
}

-- vim.cmd("colorscheme onedark")
