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
-- completion["piersolenski/wtf.nvim"] = {
--     opt = false,
--     config = function()
--         require("wtf").setup({
--             {
--                 -- Default AI popup type
--                 popup_type = "popup",
--                 -- An alternative way to set your OpenAI api key
--                 openai_api_key = "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",
--                 -- ChatGPT Model
--                 openai_model_id = "gpt-3.5-turbo",
--                 -- Set your preferred language for the response
--                 language = "english",
--                 -- Any additional instructions
--                 additional_instructions = "Start the reply with 'OH HAI THERE'",
--                 -- Default search engine, can be overridden by passing an option to WtfSeatch
--                 search_engine = "google",
--             }
--         })
--     end,
--     requires = "MunifTanjim/nui.nvim"
-- }
-- completion["dpayne/CodeGPT.nvim"] = {
--     opt = false,
--     config = function()
--         require("codegpt.config")
--     end,
--     requires = {
--         "nvim-lua/plenary.nvim",
--         "MunifTanjim/nui.nvim",
--     }
-- }

return completion
