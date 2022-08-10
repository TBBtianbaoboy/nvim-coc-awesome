local ui = {}
local conf = require("modules.ui.config")

-- @func: 提供icon
-- @keymap: nil
-- @status: true
ui["kyazdani42/nvim-web-devicons"] = {opt = false}

-- @func: vim主题
-- @keymap: nil
-- @status: true
ui["sainnhe/edge"] = {opt = false, config = conf.edge}

-- @func: vim主题
-- @keymap: nil
-- @status: true
ui["morhetz/gruvbox"] = {
    opt = false,
    as = "morhetz",
    config = conf.gruvbox
}
-- @func: 下方状态栏
-- @keymap: nil
-- @status: true
ui["hoob3rt/lualine.nvim"] = {
    opt = true,
    after = "lualine-lsp-progress",
    config = conf.lualine
}
-- @func: lualine.nvim的依赖项
-- @keymap: nil
-- @status: true
ui["arkav/lualine-lsp-progress"] = {opt = true, after = "nvim-gps"}

-- @func: dashboard面板
-- @keymap: nil
-- @status: true
ui["glepnir/dashboard-nvim"] = {opt = true, event = "BufWinEnter"}

-- Show git status in nvim
ui["lewis6991/gitsigns.nvim"] = {
    opt = true,
    event = {"BufRead", "BufNewFile"},
    config = conf.gitsigns,
    requires = {"nvim-lua/plenary.nvim", opt = true}
}
-- @func: 显示缩进对齐线
-- @keymap: nil
-- @status: true
ui["lukas-reineke/indent-blankline.nvim"] = {
    opt = true,
    event = "BufRead",
    config = conf.indent_blankline
}

-- @func: 显示上标缓冲区
-- @keymap: <leader>[0-9] | gb | gB
-- @status: true
ui["akinsho/nvim-bufferline.lua"] = {
    opt = true,
    event = "BufRead",
    config = conf.nvim_bufferline
}

return ui
