local config = {}

function config.telescope()
    require("telescope").setup {
        defaults = {
            prompt_prefix = "🔭 ",
            selection_caret = " ",
            layout_config = {
                horizontal = { prompt_position = "bottom", results_width = 0.6 },
                vertical = { mirror = false }
            },
            file_previewer = require("telescope.previewers").vim_buffer_cat.new,
            grep_previewer = require("telescope.previewers").vim_buffer_vimgrep
                .new,
            qflist_previewer = require("telescope.previewers").vim_buffer_qflist
                .new,
            file_sorter = require("telescope.sorters").get_fuzzy_file,
            file_ignore_patterns = {},
            generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
            path_display = { "absolute" },
            winblend = 0,
            border = {},
            borderchars = {
                "─", "│", "─", "│", "╭", "╮", "╯", "╰"
            },
            color_devicons = true,
            use_less = true,
            set_env = { ["COLORTERM"] = "truecolor" },
            pickers = {
                oldfiles = {
                    include_current_session = true,
                    cwd_only = true,
                }
            }
        }
    }
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
