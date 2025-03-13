return {
    "zaldih/themery.nvim",
    lazy = false,
    config = function()
        require("themery").setup({
            themes = { "vscode_modern", "gruvbox", "gruvbox-material" },
        })
    end,
}
