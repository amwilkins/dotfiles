return {
    -- Themes
    { "morhetz/gruvbox" },
    {
        "loctvl842/monokai-pro.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("monokai-pro").setup({
                filter = "spectrum",
            })
        end,
    },

    {
        --"AlexvZyl/nordic.nvim",
        "amwilkins/nordic.nvim",
        lazy = false,
        priority = 1000,
        -- config = function()
        --     require("nordic").setup({
        --         on_highlight = function(highlights, palette)
        --             highlights.LspReferenceWrite = {
        --                 bg = palette.gray3,
        --             }
        --             highlights.LspReferenceRead = {
        --                 bg = palette.gray1,
        --             }
        --             -- highlights.LspReferenceText = {
        --             --     fg = palette.green.dim,
        --             -- }
        --             highlights.Comment = {
        --                 fg = palette.gray4,
        --             }
        --         end,
        --     })
        -- end,
    },
    {
        "sainnhe/gruvbox-material",
        lazy = false,
        priority = 1000,
        config = function()
            vim.g.gruvbox_material_enable_italic = true
            vim.g.gruvbox_material_background = "medium"
            vim.g.gruvbox_material_forground = "material"
            vim.g.gruvbox_material_better_performance = 1
        end,
    },
    {
        "sainnhe/everforest",
        lazy = false,
        priority = 1000,
        config = function()
            vim.g.everforest_enable_italic = true
            vim.g.everforest_background = "medium"
            vim.g.everforest_better_performance = 1
        end,
    },
    { "gmr458/vscode_modern_theme.nvim" },
    -- Theme selector
    {
        "zaldih/themery.nvim",

        lazy = false,
        config = function()
            require("themery").setup({
                themes = { "nordic", "vscode_modern", "gruvbox-material", "monokai-pro", "everforest" },
            })
        end,
    },
}
