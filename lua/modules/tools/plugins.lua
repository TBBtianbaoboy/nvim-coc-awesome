local tools = {}
local conf = require("modules.tools.config")

-- Required by telescope.nvim
tools["RishabhRD/popfix"] = { opt = false }
-- Required by telescope.nvim
tools["nvim-lua/plenary.nvim"] = { opt = false }

-- @func: 包含一系列窗口级的功能
-- @keymap: keymap/init.lua Telescope 模块
-- @status: true ---------- all done
tools["nvim-telescope/telescope.nvim"] = {
    opt = true,
    module = "telescope",
    cmd = "Telescope",
    branch = "0.1.x",
    config = conf.telescope,
    requires = {
        {
            "nvim-lua/plenary.nvim",
            opt = false,
        },
        {
            "nvim-lua/popup.nvim",
            opt = true,
        }
    }
}

-- @func: 修改 telescope fzf 规则
-- @keymap: nil
-- @status: true ---------- all done
tools["nvim-telescope/telescope-fzf-native.nvim"] = {
    opt = true,
    run = "make",
    after = "telescope.nvim",
}

-- @func: 搜索最近使用的文件
-- @keymap: <Space>fq
-- @status: true ---------- all done
tools["nvim-telescope/telescope-frecency.nvim"] = {
    opt = true,
    requires = {
        {
            -- @Manually: 需要手动安装 sqlite3-libs 并建立 libsqlite3.so 软链接
            "tami5/sqlite.lua",
            opt = true,
        },
    },
}

-- @func: 命令行模糊搜索以及自动补充
-- @keymap: / | : | ?
-- @status: true ---------- all done
tools["gelguy/wilder.nvim"] = {
    event = "CmdlineEnter",
    config = conf.wilder,
    requires = {
        {
            "romgrk/fzy-lua-native",
            after = "wilder.nvim",
        },
    }
}

-- @func: 调试输出
-- @keymap: g?v | g?V | g?p | g?P
-- @status: true ---------- all done
tools["andrewferrier/debugprint.nvim"] = {
    opt = true,
    ft = {
        "c",
        "cpp",
        "cxx",
        "h",
        "hpp",
        "hxx",
        "lua",
        "py",
        "sh",
        "go",
        "vim",
        "zsh",
    },
    config = conf.debugprint,
}


-- @func: ascii image in nvim terminal
-- @keymap: nil
-- @status: true ---------- all done
-- @Manually: 需要手动安装 ascii-image-converter 并置于 $PATH
tools["samodostal/image.nvim"] = {
    opt = false,
    requires = {
        {
            "nvim-lua/plenary.nvim",
            opt = false,
        },
    },
    config = conf.image,
}

-- @func: emoji input
-- @keymap: 'i | <A-m>'
-- @status: true ---------- all done
tools["WilsonOh/emoji_picker-nvim"] = {
    opt = true,
    event = "InsertEnter",
    config = function()
        require("emoji_picker").setup()
        vim.keymap.set("i", "<A-m>", "<cmd>EmojiPicker<cr>")
    end,
}


return tools
