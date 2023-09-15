local completion = {}

completion["neoclide/coc.nvim"] = {
    opt = true,
    event = "BufRead",
    branch = "release",
    config = function()
        -- lua运行vim配置文件
        vim.api.nvim_exec(
            [[source ~/.config/nvim/lua/modules/completion/coc_config.vim]],
            false)
    end
}
completion["github/copilot.vim"] = {
    opt = false,
    -- opt == false, the cmd should be empty
    -- cmd = "Copilot",
    config = function()
        -- lua运行vim配置文件
        vim.api.nvim_exec(
            [[source ~/.config/nvim/lua/modules/completion/copilot.vim]],
            false)
    end
}

return completion
