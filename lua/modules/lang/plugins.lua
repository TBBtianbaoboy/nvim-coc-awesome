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
lang["mfussenegger/nvim-dap"] = {
	opt = true,
	cmd = {
		"DapSetLogLevel",
		"DapShowLog",
		"DapContinue",
		"DapToggleBreakpoint",
		"DapToggleRepl",
		"DapStepOver",
		"DapStepInto",
		"DapStepOut",
		"DapTerminate",
	},
	module = "dap",
	config = conf.dap,
}
lang["rcarriga/nvim-dap-ui"] = {
	opt = true,
	after = "nvim-dap", -- Need to call setup after dap has been initialized.
	config = conf.dapui,
}
return lang
