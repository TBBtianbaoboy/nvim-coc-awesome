return function()
	local opts = {
		line_keys = "1234567890",
		select_menu_item_commands = {
			edit = {
				key = "<CR>",
				command = "edit",
			},
		},
		focus_alternate_buffer = false,
		short_file_names = false,
		short_term_names = false,
		loop_nav = true,
		highlight = "",
		win_extra_options = {},
		borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
	}

	require("modules.utils").load_plugin("buffer_manager", opts)
end
