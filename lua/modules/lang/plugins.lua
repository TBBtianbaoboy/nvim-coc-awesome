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

return lang
