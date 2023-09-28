local lang = {}

-- @func: golang helper
-- @keymap: nil
-- @status: true ---------- all done
lang["fatih/vim-go"] = {
	lazy = true,
	ft = "go",
	build = ":GoInstallBinaries",
	config = require("lang.vim-go"),
}

-- @func: rust helper
-- @keymap: nil
-- @status: true ---------- all done
lang["simrat39/rust-tools.nvim"] = {
	lazy = true,
	ft = "rust",
	config = require("lang.rust-tools"),
	dependencies = { "nvim-lua/plenary.nvim" },
}
lang["Saecki/crates.nvim"] = {
	lazy = true,
	event = "BufReadPost Cargo.toml",
	config = require("lang.crates"),
	dependencies = { "nvim-lua/plenary.nvim" },
}

-- @func: markdown helper
-- @keymap: <F12>
-- @status: true ---------- all done
lang["iamcco/markdown-preview.nvim"] = {
	lazy = true,
	ft = "markdown",
	build = ":call mkdp#util#install()",
}

-- @func: csv helper
-- @keymap: nil
-- @status: true ---------- all done
lang["chrisbra/csv.vim"] = {
	lazy = true,
	ft = "csv",
}

-- @func: xmake helper
-- @keymap: nil
-- @status: true ---------- all done
lang["luzhlon/xmake.vim"] = {
	lazy = true,
	ft = "xmake",
	dependencies = {
		{ "luzhlon/x.vim" },
		{ "luzhlon/qrun.vim" },
	},
}

-- @func: tablegen entension
-- @keymap: nil
-- @status: true ---------- all done
lang["antiagainst/vim-tablegen"] = {
	lazy = true,
	ft = "td",
}

-- @func: mlir entension
-- @keymap: nil
-- @status: true ---------- all done
lang["hunterzju/mlir-vim"] = {
	lazy = true,
	ft = "mlir",
}

return lang
