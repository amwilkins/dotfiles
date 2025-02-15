return {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
    version = "*", -- Pin Neorg to the latest stable release
    config = function()
        require("neorg").setup({
            load = {
                ["core.defaults"] = {},
                ["core.summary"] = {},
                ["core.concealer"] = {
                    config = {
                        icons = {
                            todo = {
                                undone = {
                                    icon = " ",
                                },
                            },
                        },
                    },
                },
                ["core.dirman"] = {
                    config = {
                        workspaces = {
                            notes = "~/Sync/notes/org",
                        },
                        default_workspace = "notes",
                        index = "index.norg",
                    },
                },
                ["core.completion"] = {
                    config = {
                        engine = "nvim-cmp",
                    },
                },
                ["core.journal"] = {
                    config = {
                        strategy = "flat",
                        template_name = "template.norg",
                        use_template = true,
                    },
                },
            },
        })
    end,
}
