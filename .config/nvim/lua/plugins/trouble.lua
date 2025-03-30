-- Check if current buffer is in quickfix list
local function is_in_quickfix(bufnr)
    --local bufnr = vim.api.nvim_get_current_buf()
    for _, entry in ipairs(vim.fn.getqflist()) do
        if entry.bufnr == bufnr then
            return true
        end
    end
    return false
end

-- close buffer
local function close_if_leaving_qf(bufnr)
    if is_in_quickfix(bufnr) then
        if not vim.bo[bufnr].modified then
            vim.cmd("bd " .. bufnr)
        end
    end
    return true
end

return {
    "folke/trouble.nvim",
    cmd = { "Trouble" },
    keys = {
        -- These are altered to close the previous buffer is we are leaving an unmodified QF buffer.
        {
            "[q",
            function()
                local bufnr = vim.api.nvim_get_current_buf()
                if require("trouble").is_open() then
                    require("trouble").prev({ skip_groups = true, jump = true })
                else
                    local ok, err = pcall(vim.cmd.cprev)
                    if not ok then
                        vim.notify(err, vim.log.levels.ERROR)
                    else
                        close_if_leaving_qf(bufnr)
                    end
                end
            end,
            desc = "Previous Trouble/Quickfix Item",
        },
        {
            "]q",
            function()
                local bufnr = vim.api.nvim_get_current_buf()
                if require("trouble").is_open() then
                    require("trouble").next({ skip_groups = true, jump = true })
                else
                    local ok, err = pcall(vim.cmd.cnext)
                    if not ok then
                        vim.notify(err, vim.log.levels.ERROR)
                    else
                        close_if_leaving_qf(bufnr)
                    end
                end
            end,
            desc = "Next Trouble/Quickfix Item",
        },
    },
}
