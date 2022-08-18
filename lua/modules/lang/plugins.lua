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

-- @func: 运行代码片段
-- @keymap: unknow
-- @status: false
lang['michaelb/sniprun'] = {
    opt = false,
    run = 'bash ./install.sh',
    config = conf.lang_sniprun
}

return lang
