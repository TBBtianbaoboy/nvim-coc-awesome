local tools = {}
local conf = require("modules.tools.config")

-- Required by telescope.nvim
tools["RishabhRD/popfix"] = {opt = false}
-- Required by telescope.nvim
tools["nvim-lua/plenary.nvim"] = {opt = false}
-- Find, Filter, Preview, Pick
tools["nvim-telescope/telescope.nvim"] = {
    opt = true,
    module = "telescope",
    cmd = "Telescope",
    config = conf.telescope,
    requires = {
        {"nvim-lua/plenary.nvim", opt = false},
        {"nvim-lua/popup.nvim", opt = true}
    }
}

-- @func: 命令行模糊搜索以及自动补充
-- @keymap: / | : | ?
-- @status: false 还不够智能
tools["gelguy/wilder.nvim"] = {
    event = "CmdlineEnter",
    config = conf.wilder,
    requires = {{"romgrk/fzy-lua-native", after = "wilder.nvim"}}
}

return tools
