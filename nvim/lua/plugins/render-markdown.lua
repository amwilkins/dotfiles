return {
    "MeanderingProgrammer/render-markdown.nvim",
    name = "render-markdown",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = {
        heading = {
            backgrounds = {},
        },
    },
    config = function()
        require("render-markdown").setup({
            file_types = { "markdown", "md", "telekasten" },
            log_level = "debug",
            render_modes = true,
        })
    end,
}
