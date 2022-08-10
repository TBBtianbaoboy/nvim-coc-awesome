-- @All
-- 与编辑相关的插件配置
-- LearnMap

local editor = {}
local conf = require("modules.editor.config")

-- @func: 自动对齐
-- @keymap: ga
-- @status: true
editor["junegunn/vim-easy-align"] = { opt = true, cmd = "EasyAlign" }

-- @func: 给光标所在的所有相同单词增加下划线
-- @keymap: nil
-- @status: true
editor["itchyny/vim-cursorword"] = {
    opt    = true,
    event  = { "BufReadPre", "BufNewFile" },
    config = conf.vim_cursorwod
}

-- @func: 注释(结合使用了nvim_treesitter的子模块)
-- @keymap: n|gcc , v|gc
-- @status: true
editor["terrortylor/nvim-comment"] = {
    opt = false,
    config = function()
        require("nvim_comment").setup({
            hook = function()
                require("ts_context_commentstring.internal").update_commentstring()
            end,
        })
    end
}

-- @func: 右侧大纲
-- @keymap: n|<space>so , n|<leader>so
-- @status: true
editor["simrat39/symbols-outline.nvim"] = {
    opt = true,
    cmd = { "SymbolsOutline", "SymbolsOutlineOpen" },
    config = conf.symbols_outline
}

-- @func: 高亮集景
-- @keymap: nil
-- @status: true
editor["nvim-treesitter/nvim-treesitter"] = {
    opt = true,
    run = ":TSUpdate",
    event = "BufRead",
    config = conf.nvim_treesitter
}

-- @func: 区块选择和移动(nvim_treesitter的子模块)
-- @keymap: conf.nvim_treesitter的label 1
-- @status: true
editor["nvim-treesitter/nvim-treesitter-textobjects"] = {
    opt = true,
    after = "nvim-treesitter"
}

-- @func: 给括号增加颜色(nvim_treesitter的子模块)
-- @keymap: conf.nvim_treesitter 的label 2
-- @status: true
editor["p00f/nvim-ts-rainbow"] = {
    opt = true,
    after = "nvim-treesitter",
    event = "BufRead"
}

-- @func: 自动根据文件类型进行注释(nvim_treesitter的子模块)
-- @keymap: conf.nvim_treesitter 的label 3
-- @status: true
editor["JoosepAlviste/nvim-ts-context-commentstring"] = {
    opt = true,
    after = "nvim-treesitter"
}

-- @func: 显示当前光标在代码中所处的位置(nvim_treesitter的子模块)
-- @keymap: nil
-- @status: true
editor["SmiteshP/nvim-gps"] = {
    opt = true,
    after = "nvim-treesitter",
    config = conf.nvim_gps
}

-- @func: 自动打标签
-- @keymap: nil
-- @status: false
editor["windwp/nvim-ts-autotag"] = {
    opt = true,
    config = conf.autotag
}

-- @func: %跳装匹配的扩展(nvim_treesitter的子模块)
-- @keymap: %(conf.nvim_treesitter的label 4)
-- @status: true
editor["andymass/vim-matchup"] = {
    opt = true,
    after = "nvim-treesitter",
    config = conf.matchup
}

-- @func: 加速j/k移动的速度
-- @keymap: j k
-- @status: true
editor["rhysd/accelerated-jk"] = { opt = true }

-- @func: 高亮f/t跳转的位置
-- @keymap: f t F T
-- @status: true
editor["hrsh7th/vim-eft"] = { opt = true }

-- @func: 使用删除键取消搜索高亮时，可以再次搜索，且自动不高亮
-- @keymap: n N
-- @status: true
editor["romainl/vim-cool"] = {
    opt = true,
    event = { "CursorMoved", "InsertEnter" }
}

-- @func: 热词跳转，可以跳转到任何想要跳到的地方
-- @keymap: <leader>h | <leader>j | <leader>c1 | <leader>c2
-- @status: true
editor["phaazon/hop.nvim"] = {
    opt = true,
    branch = "v1",
    cmd = {
        "HopLine", "HopLineStart", "HopWord", "HopPattern", "HopChar1",
        "HopChar2"
    },
    config = function()
        require("hop").setup { keys = "etovxqpdygfblzhckisuran" }
    end
}

-- @func: 屏幕滚动
-- @keymap: conf.neoscroll
-- @status: true
editor["karb94/neoscroll.nvim"] = {
    opt = true,
    event = "WinScrolled",
    config = conf.neoscroll
}

-- @func: vim shell
-- @keymap: <F12> | :vs :sp 是用来打开vim的
-- @status: true
editor["akinsho/nvim-toggleterm.lua"] = {
    opt = true,
    event = "BufRead",
    config = conf.toggleterm
}

-- @func: 打开一个shell窗口并运行相应的命令，比如 <space>g
-- @keymap: <space>g
-- @status: true
editor["numtostr/FTerm.nvim"] = { opt = true, event = "BufRead" }

-- @func: 给#ffffff配上颜色
-- @keymap: nil
-- @status: true
editor["norcalli/nvim-colorizer.lua"] = {
    opt = true,
    event = "BufRead",
    config = conf.nvim_colorizer
}

-- @func: 自动保存并记录会话的位置，退出后进入时会恢复位置
-- @keymap: nil
-- @status: true
editor["rmagatti/auto-session"] = {
    opt = true,
    cmd = { "SaveSession", "RestoreSession", "DeleteSession" },
    config = conf.auto_session
}

-- @func: 未知
-- @keymap: unknow
-- @status: false
-- editor["rcarriga/nvim-dap-ui"] = {
--     opt = false,
--     config = conf.dapui,
--     requires = {
--         {"mfussenegger/nvim-dap", config = conf.dap}, {
--             "Pocco81/DAPInstall.nvim",
--             opt = true,
--             cmd = {"DIInstall", "DIUninstall", "DIList"},
--             config = conf.dapinstall
--         }
--     }
-- }

-- @func: 在vim 中运行 git 命令
-- @keymap: :G
-- @status: true
editor["tpope/vim-fugitive"] = { opt = true, cmd = { "Git", "G" } }

return editor
