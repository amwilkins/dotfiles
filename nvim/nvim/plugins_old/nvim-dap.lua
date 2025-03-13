return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
	  "nvim-neotest/nvim-nio",
      "rcarriga/nvim-dap-ui",
      "mfussenegger/nvim-dap-python",
      "theHamsta/nvim-dap-virtual-text",
    },
--
-- local mason_dap = require("mason-nvim-dap")
--
-- mason_dap.setup({
--     ensure_installed = { "python" },
--     automatic_installation = true,
--     handlers = {
--         function(config)
--             require("mason-nvim-dap").default_setup(config)
--         end,
--     },
-- })

-- local dap = require("dap")
-- dap.configurations.python = {
--     {
--         type = "python",
--         request = "launch",
--         name = "Launch file",
--         program = "${file}",
--         -- pythonPath = function()
--         --     local cwd = vim.fn.getcwd()
--         --     if vim.fn.executable(cwd .. "/venv/bin/python") == 1 then
--         --         return cwd .. "/venv/bin/python"
--         --     elseif vim.fn.executable(cwd .. "/.venv/bin/python") == 1 then
--         --         return cwd .. "/.venv/bin/python"
--         --     else
--         --         return "/usr/bin/python"
--         --     end
--         -- end,
--     },
-- }
