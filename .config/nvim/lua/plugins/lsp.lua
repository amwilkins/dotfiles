-- return {
--     "neovim/nvim-lspconfig",
--     opts = {
--         servers = {
--             dockerls = {},
--             docker_compose_language_service = {},
--         },
--         setup = {
--             clangd = function(_, opts)
--                 opts.capabilities.offsetEncoding = { "utf-16" }
--             end,
--         },
--     },
-- }

return {
    {
        "neovim/nvim-lspconfig",
        opts = function(_, opts_)
            opts_.servers = {}
        end,
    },
}
