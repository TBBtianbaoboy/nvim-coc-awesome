local config = {}

function config.telescope()
    vim.cmd([[packadd telescope-fzf-native.nvim]])
    vim.cmd([[packadd sqlite.lua]])
    vim.cmd([[packadd telescope-frecency.nvim]])

    require("telescope").setup {
        defaults = {
            -- Default configuration for telescope goes here:
            -- config_key = value,
            layout_strategy = "horizontal",
            prompt_prefix = "🔍 ",
            selection_caret = " ",
            layout_config = {
                prompt_position = "bottom",
                horizontal = {
                    preview_width = 0.5,
                },
            },
            entry_prefix = '',
            initial_mode = "insert",
            path_display = { "absolute" },
            file_ignore_patterns = {},

            -- mapping config TODO
            mappings = {
                i = {
                    ["<C-/>"] = "which_key",
                    ["<C-c>"] = false,
                    ["<esc>"] = "close",
                    ["<C-j>"] = "move_selection_next",
                    ["<C-k>"] = "move_selection_previous",
                    ["<C-[>"] = "move_to_top",
                    ["<C-]>"] = "move_to_bottom",
                    ["<C-u>"] = "preview_scrolling_up",
                    ["<C-d>"] = "preview_scrolling_down",
                },
            }
        },
        -- packers config
        pickers = {
            -- picker_name = {
            --   picker_config_key = value,
            --   ...
            -- }
            grep_string = {
                only_sort_text = true,
            },
            git_files = {
                show_untracked = true,
            },
            colorscheme = {
                enable_preview = true,
            },
        },
        -- extensions config
        extensions = {
            -- extension_name = {
            --   extension_config_key = value,
            -- }
            fzf = {
                fuzzy = false, -- false will only do exact matching
                override_generic_sorter = true, -- override the generic sorter
                override_file_sorter = true, -- override the file sorter
                case_mode = "smart_case", -- or "ignore_case" or "respect_case"
                -- the default case_mode is "smart_case"
            },
            frecency = {
                show_scores = true,
                show_unindexed = true,
                ignore_patterns = { "*.git/*", "*/tmp/*" },
            },
        }
    }
    require('telescope').load_extension('fzf')
    require("telescope").load_extension("frecency")
end

function config.wilder()
    -- set up basic
    local wilder = require('wilder')
    wilder.setup({ modes = { ':', '/', '?' } })

    -- vim command set up fzf
    wilder.set_option('pipeline', {
        wilder.branch(
        -- vim commamd file or directory fzf
            wilder.python_file_finder_pipeline({
                -- to use ripgrep : {'rg', '--files'}
                -- to use fd      : {'fd', '-tf'}
                -- file_command = { 'find', '.', '-type', 'f', '-printf', '%P\n' },
                file_command = { 'rg', '--files' },
                -- to use fd      : {'fd', '-td'}
                -- dir_command = { 'find', '.', '-type', 'd', '-printf', '%P\n' },
                dir_command = { 'fd', '-td' },
                -- use {'cpsm_filter'} for performance, requires cpsm vim plugin
                -- found at https://github.com/nixprime/cpsm
                filters = { 'fuzzy_filter', 'difflib_sorter' },
            }),
            wilder.cmdline_pipeline({
                -- sets the language to use, 'vim' and 'python' are supported
                language = 'python',
                -- 0 turns off fuzzy matching
                -- 1 turns on fuzzy matching
                -- 2 partial fuzzy matching (match does not have to begin with the same first letter)
                fuzzy = 1,
            }),
            wilder.python_search_pipeline({
                -- can be set to wilder#python_fuzzy_delimiter_pattern() for stricter fuzzy matching
                pattern = wilder.python_fuzzy_pattern(),
                -- omit to get results in the order they appear in the buffer
                sorter = wilder.python_difflib_sorter(),
                -- can be set to 're2' for performance, requires pyre2 to be installed
                -- see :h wilder#python_search() for more details
                engine = 're',
            })
        ),
    })
    -- set pop menu
    local gradient = {
        '#f4468f', '#fd4a85', '#ff507a', '#ff566f', '#ff5e63',
        '#ff6658', '#ff704e', '#ff7a45', '#ff843d', '#ff9036',
        '#f89b31', '#efa72f', '#e6b32e', '#dcbe30', '#d2c934',
        '#c8d43a', '#bfde43', '#b6e84e', '#aff05b'
    }

    for i, fg in ipairs(gradient) do
        gradient[i] = wilder.make_hl('WilderGradient' .. i, 'Pmenu', { { a = 1 }, { a = 1 }, { foreground = fg } })
    end
    wilder.set_option('renderer', wilder.popupmenu_renderer({
        -- highlighter = wilder.basic_highlighter(),
        highlights = {
            gradient = gradient, -- must be set
            -- selected_gradient key can be set to apply gradient highlighting for the selected candidate.
        },
        highlighter = wilder.highlighter_with_gradient({
            -- wilder.basic_highlighter(), -- or wilder.lua_fzy_highlighter(),
            wilder.lua_fzy_highlighter(),
        }),
        left = { ' ', wilder.popupmenu_devicons() },
        right = { ' ', wilder.popupmenu_scrollbar() },
    }))
end

return config
