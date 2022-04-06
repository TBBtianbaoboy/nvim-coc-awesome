local lang = {}
local conf = require("modules.lang.config")

-- @func: 未知
-- @keymap: unknow
-- @status: false
lang['fatih/vim-go'] = {
    opt = true,
    ft = 'go',
    run = ':GoInstallBinaries',
    config = conf.lang_go
}

-- @func: 未知
-- @keymap: unknow
-- @status: false
lang["rust-lang/rust.vim"] = {opt = true, ft = "rust"}

-- @func: 未知
-- @keymap: unknow
-- @status: false
lang["simrat39/rust-tools.nvim"] = {
    opt = true,
    ft = "rust",
    config = conf.rust_tools,
    requires = {{"nvim-lua/plenary.nvim", opt = false}}
}

-- @func: 是markdown内容显示在网页中
-- @keymap: <F5>
-- @status: true
lang["iamcco/markdown-preview.nvim"] = {
    opt = true,
    ft = "markdown",
    run = "cd app && yarn install"
}

return lang
