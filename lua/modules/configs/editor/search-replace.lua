return function()
	-- show the effects of a search / replace in a live preview window
	vim.o.inccommand = "split"

	require("modules.utils").load_plugin("search-replace", {
		-- optionally override defaults
		default_replace_single_buffer_options = "g",
		default_replace_multi_buffer_options = "eg",
	})
end
