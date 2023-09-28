local ui = {}

ui["goolord/alpha-nvim"] = {
	lazy = true,
	event = "BufWinEnter",
	config = require("ui.alpha"),
}

-- @func: show nvim buffer and interactive with it
-- @keymap: "<Space>b"
-- @status: true ---------- all done
ui["j-morano/buffer_manager.nvim"] = {
	lazy = true,
	event = { "BufReadPost", "BufAdd", "BufNewFile" },
	config = require("ui.buffer_manager"),
}

-- @func: only nvim theme
-- @keymap: nil
-- @status: true ---------- all done
ui["morhetz/gruvbox"] = {
	lazy = false,
	config = require("ui.gruvbox"),
}

-- @func: provide a UI for nvim-lsp's progress handler
-- @keymap: nil
-- @status: true ---------- all done
ui["j-hui/fidget.nvim"] = {
	lazy = true,
	branch = "legacy",
	event = "LspAttach",
	config = require("ui.fidget"),
}

-- @func: git 快速操作
-- @keymap: see keymap/ui.lua
-- @status: true ---------- all done
ui["lewis6991/gitsigns.nvim"] = {
	lazy = true,
	event = { "CursorHold", "CursorHoldI" },
	config = require("ui.gitsigns"),
}

-- @func: 显示缩进对齐线
-- @keymap: nil
-- @status: true ---------- all done
ui["lukas-reineke/indent-blankline.nvim"] = {
	lazy = true,
	event = { "CursorHold", "CursorHoldI" },
	config = require("ui.indent-blankline"),
}

-- @func: 下方状态栏
-- @keymap: nil
-- @status: true ---------- all done
ui["nvim-lualine/lualine.nvim"] = {
	lazy = true,
	event = { "BufReadPost", "BufAdd", "BufNewFile" },
	config = require("ui.lualine"),
}

-- @func: 屏幕滚动
-- @keymap: "<C-u>", "<C-d>", "<C-b>", "<C-f>", "<C-y>", "<C-e>", "zt", "zz", "zb",
-- @status: true ---------- all done
ui["karb94/neoscroll.nvim"] = {
	lazy = true,
	event = { "CursorHold", "CursorHoldI" },
	config = require("ui.neoscroll"),
}

-- @func: 消息通知窗口
-- @keymap: nil
-- @status: true ---------- all done
ui["rcarriga/nvim-notify"] = {
	lazy = true,
	event = "VeryLazy",
	config = require("ui.notify"),
}

return ui
