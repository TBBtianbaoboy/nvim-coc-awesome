return function()
	vim.g.expand_region_text_objects = {
		["iw"] = 0,
		['i"'] = 0,
		['a"'] = 0,
		["i''"] = 0,
		["a''"] = 0,
		["i`"] = 0,
		["a`"] = 0,
		["i)"] = 1,
		["a)"] = 1,
		["i]"] = 1,
		["a]"] = 1,
		["i}"] = 1,
		["a}"] = 1,
		["it"] = 1,
		["at"] = 1,
	}

	require("modules.utils").load_plugin("vim-expand-region", nil, true)
end
