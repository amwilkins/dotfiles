return {

    -- add more treesitter parsers
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            overrides = {
                ["@markup.heading.1.markdown"] = { fg = "#fb4934", bg = "", bold = true },
                ["@markup.heading.2.markdown"] = { fg = "#fabd2f", bg = "", bold = true },
                ["@markup.heading.3.markdown"] = { fg = "#b8bb26", bg = "", bold = true },
                ["@markup.heading.4.markdown"] = { fg = "#8ec07c", bg = "", bold = true },
                ["@markup.heading.5.markdown"] = { fg = "#83a598", bg = "", bold = true },
                ["@markup.heading.6.markdown"] = { fg = "#d3869b", bg = "", bold = true },
            },
            ensure_installed = {
                "bash",
                "html",
                "javascript",
                "json",
                "lua",
                "markdown",
                "markdown_inline",
                "python",
                "query",
                "regex",
                "tsx",
                "typescript",
                "vim",
                "yaml",
            },
        },
        require("vim.treesitter.language").register("markdown", "telekasten"),
    },
}
