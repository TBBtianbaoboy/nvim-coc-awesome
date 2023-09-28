local editor = {}

-- @func: 加速j/k移动的速度
-- @keymap: j k
-- @status: true ---------- all done
editor["rainbowhxch/accelerated-jk.nvim"] = {
	lazy = true,
	event = "VeryLazy",
	config = require("editor.accelerated-jk"),
}

-- @func: 从插入模式退出到普通模式
-- @keymap: jj jk
-- @status: true ---------- all done
editor["max397574/better-escape.nvim"] = {
	lazy = true,
	event = { "CursorHold", "CursorHoldI" },
	config = require("editor.better-escape"),
}

-- @func: 关闭当前buffer
-- @keymap: <A-q>
-- @status: true ---------- all done
editor["ojroques/nvim-bufdel"] = {
	lazy = true,
	cmd = { "BufDel", "BufDelAll", "BufDelOthers" },
}

-- @func: 高亮f/t跳转的位置
-- @keymap: f t F T ; ,
-- @status: true ---------- all done
editor["rhysd/clever-f.vim"] = {
	lazy = true,
	event = { "CursorHold", "CursorHoldI" },
	config = require("editor.cleverf"),
}

-- @func: 注释
-- @keymap: n|gcc , v|gc , n|gb
-- @status: true ---------- all done
editor["numToStr/Comment.nvim"] = {
	lazy = true,
	event = { "CursorHold", "CursorHoldI" },
	config = require("editor.comment"),
}

-- @func: git diff view
-- @keymap: ]d ]D
-- @status: true ---------- all done
editor["sindrets/diffview.nvim"] = {
	lazy = true,
	cmd = { "DiffviewOpen", "DiffviewClose" },
}

-- @func: 自动对齐
-- @keymap: gea<key>
-- @status: true ---------- all done
editor["junegunn/vim-easy-align"] = {
	lazy = true,
	cmd = "EasyAlign",
}

-- @func: 热词跳转，可以跳转到任何想要跳到的地方
-- @keymap: <leader>h | <leader>j | <leader>k | <leader>l
-- @status: true ---------- all done
editor["smoka7/hop.nvim"] = {
	lazy = true,
	version = "*",
	event = { "CursorHold", "CursorHoldI" },
	config = require("editor.hop"),
}

-- @func: 使用删除键取消搜索高亮时，可以再次搜索，且自动不高亮
-- @keymap: n N
-- @status: true ---------- all done
editor["romainl/vim-cool"] = {
	lazy = true,
	event = { "CursorMoved", "InsertEnter" },
}

-- @func: sudo 保存文件
-- @keymap: <A-s>
-- @status: true ---------- all done
editor["lambdalisue/suda.vim"] = {
	lazy = true,
	cmd = { "SudaRead", "SudaWrite" },
	config = require("editor.suda"),
}

-- @func: 修改变量形式
-- @keymap: :'n | crc', 'n | crm', 'n | crs' 最常用，更多用法请查阅帮助手册
-- @status: true ---------- all done
editor["tpope/vim-abolish"] = {
	lazy = true,
	event = "VeryLazy",
}

-- @func: v V 框选
-- @keymap: v -> 正选, V -> 反选(撤销)
-- @status: true ---------- all done
editor["terryma/vim-expand-region"] = {
	lazy = true,
	event = "VeryLazy",
	config = require("editor.vim-expand-region"),
}

-- @func: 代码行拆分或合并
-- @keymap: gS -> 拆分, gJ -> 合并
-- @status: true --------- all done
editor["AndrewRadev/splitjoin.vim"] = {
	lazy = true,
	event = "BufReadPost",
}

-- @func: search replace
-- @keymap: <C-r> -> 选中区域搜索替换 | <leader>ro -> 打开搜索替换窗口 | <leader>rw -> 替换光标下的单词 | <leader>re -> 替换光标下的表达式
-- @status: true --------- all done
editor["roobert/search-replace.nvim"] = {
	lazy = true,
	cmd = {
		"SearchReplaceWithinVisualSelection",
		"SearchReplaceSingleBufferOpen",
		"SearchReplaceSingleBufferCWord",
		"SearchReplaceSingleBufferCExpr",
	},
	config = require("editor.search-replace"),
}

-- @func: local translator and spelling
-- @keymap:
-- @status: true --------- all done
editor["JuanZoran/Trans.nvim"] = {
	opt = true,
	branch = "v2",
	cmd = {
		"TranslateInput",
		"Translate",
		"Transplay",
	},
	build = function()
		vim.api.nvim_command("lua require'Trans'.install()")
	end,
	config = require("editor.Trans"),
}

----------------------------------------------------------------------
--                  :treesitter related plugins                    --
----------------------------------------------------------------------
editor["nvim-treesitter/nvim-treesitter"] = {
	lazy = true,
	build = function()
		if #vim.api.nvim_list_uis() ~= 0 then
			vim.api.nvim_command("TSUpdate")
		end
	end,
	event = "BufReadPost",
	config = require("editor.treesitter"),
	dependencies = {
		{ "nvim-treesitter/nvim-treesitter-textobjects" },
		{ "JoosepAlviste/nvim-ts-context-commentstring" },
		{ "andymass/vim-matchup" },
		{
			"hiphish/rainbow-delimiters.nvim",
			config = require("editor.rainbow_delims"),
		},
		{
			"nvim-treesitter/nvim-treesitter-context",
			config = require("editor.ts-context"),
		},
		{
			"windwp/nvim-ts-autotag",
			config = require("editor.autotag"),
		},
		{
			"NvChad/nvim-colorizer.lua",
			config = require("editor.colorizer"),
		},
		{
			"abecodes/tabout.nvim",
			config = require("editor.tabout"),
		},
	},
}

-- @func: 非重点插件, 可以忽略但不要省略
-- @keymap: nil
-- @status: true ---------- all done

editor["m4xshen/autoclose.nvim"] = {
	lazy = true,
	event = "InsertEnter",
	config = require("editor.autoclose"),
}

editor["LunarVim/bigfile.nvim"] = {
	lazy = false,
	config = require("editor.bigfile"),
	cond = require("core.settings").load_big_files_faster,
}

editor["RRethy/vim-illuminate"] = {
	lazy = true,
	event = { "CursorHold", "CursorHoldI" },
	config = require("editor.vim-illuminate"),
}

return editor
