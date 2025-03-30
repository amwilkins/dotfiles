return {
    {
        "norcalli/nvim-colorizer.lua",
        lazy = true,
        priority = 1000,

        config = function()
            require("colorizer").setup({}, { names = false })
        end,
    },
}
