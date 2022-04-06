local config = {}

function config.edge()
    vim.cmd [[set background=dark]]
    vim.g.edge_style = "aura"
    vim.g.edge_enable_italic = 1
    vim.g.edge_disable_italic_comment = 1
    vim.g.edge_show_eob = 1
    vim.g.edge_better_performance = 1
    vim.g.edge_transparent_background = 1
end

function config.lualine()
    local gps = require("nvim-gps")

    local function gps_content()
        if gps.is_available() then
            return gps.get_location()
        else
            return ""
        end
    end
    local symbols_outline = {
        sections = {
            lualine_a = {'mode'},
            lualine_b = {'filetype'},
            lualine_c = {},
            lualine_x = {},
            lualine_y = {},
            lualine_z = {'location'}
        },
        filetypes = {'Outline'}
    }

    require("lualine").setup {
        options = {
            icons_enabled = true,
            theme = "gruvbox",
            disabled_filetypes = {},
            component_separators = "|",
            section_separators = {left = "", right = ""}
        },
        sections = {
            lualine_a = {"mode"},
            lualine_b = {{"branch"}, {"diff"}},
            lualine_c = {
                {"lsp_progress"}, {gps_content, cond = gps.is_available}
            },
            lualine_x = {
                {
                    "diagnostics",
                    sources = {'nvim_diagnostic'},
                    symbols = {error = " ", warn = " ", info = " "}
                }
            },
            lualine_y = {"filetype", "encoding", "fileformat"},
            lualine_z = {"progress", "location"}
        },
        inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = {"filename"},
            lualine_x = {"location"},
            lualine_y = {},
            lualine_z = {}
        },
        tabline = {},
        extensions = {
            "quickfix", "nvim-tree", "toggleterm", "fugitive", symbols_outline
        }
    }
end

function config.nvim_tree()
    require("nvim-tree").setup {
        auto_reload_on_write = true,
        disable_netrw = false,
        hide_root_folder = false,
        hijack_cursor = false,
        hijack_netrw = true,
        hijack_unnamed_buffer_when_opening = false,
        ignore_buffer_on_setup = false,
        open_on_setup = false,
        open_on_setup_file = false,
        open_on_tab = false,
        sort_by = "name",
        update_cwd = false,
        view = {
            width = 30,
            height = 30,
            side = "left",
            preserve_window_proportions = false,
            number = false,
            relativenumber = false,
            signcolumn = "yes",
            mappings = {
                custom_only = false,
                list = {
                     { key = "l",                        action = "preview" },
                     { key = "h",                         action = "close_node" },
                     { key = "H",                         action = "dir_up" },
                     { key = "L",    action = "cd" },
                     { key = "<C-v>",                        action = "vsplit" },
                     { key = "<C-s>",                        action = "split" },
                     { key = "<Tab>",                        action = "tabnew" },
                     { key = "P",                            action = "parent_node" },
                     { key = "K",                            action = "first_sibling" },
                     { key = "J",                            action = "last_sibling" },
                     { key = "R",                            action = "refresh" },
                     { key = "a",                            action = "create" },
                     { key = "d",                            action = "remove" },
                     { key = "D",                            action = "trash" },
                     { key = "r",                            action = "rename" },
                     { key = "<C-r>",                        action = "full_rename" },
                     { key = "x",                            action = "cut" },
                     { key = "c",                            action = "copy" },
                     { key = "p",                            action = "paste" },
                     { key = "y",                            action = "copy_name" },
                     { key = "Y",                            action = "copy_path" },
                     { key = "gy",                           action = "copy_absolute_path" },
                     { key = "[c",                           action = "prev_git_item" },
                     { key = "]c",                           action = "next_git_item" },
                     { key = "s",                            action = "system_open" },
                     { key = "q",                            action = "close" },
                     { key = "g?",                           action = "toggle_help" },
                     { key = "W",                            action = "collapse_all" },
                     { key = "S",                            action = "search_node" },
                     { key = "<C-k>",                        action = "toggle_file_info" },
                     { key = ".",                            action = "run_file_command" }
                },
            },
        },
        hijack_directories = {
            enable = true,
            auto_open = true,
        },
        update_focused_file = {
            enable = false,
            update_cwd = false,
            ignore_list = {},
        },
        ignore_ft_on_setup = {},
        system_open = {
            cmd = nil,
            args = {},
        },
        diagnostics = {
            enable = false,
            show_on_dirs = false,
            icons = {
                hint = "",
                info = "",
                warning = "",
                error = "",
            },
        },
        filters = {
            dotfiles = false,
            custom = {},
            exclude = {},
        },
        git = {
            enable = true,
            ignore = true,
            timeout = 400,
        },
        actions = {
            change_dir = {
                enable = true,
                global = false,
            },
            open_file = {
                quit_on_open = false,
                resize_window = false,
                window_picker = {
                    enable = true,
                    chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
                    exclude = {
                        filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
                        buftype = { "nofile", "terminal", "help" },
                    },
                },
            },
        },
        trash = {
            cmd = "trash",
            require_confirm = true,
        },
        log = {
            enable = false,
            truncate = false,
            types = {
                all = false,
                config = false,
                copy_paste = false,
                git = false,
                profile = false,
            },
        },
    }
end

function config.nvim_bufferline()
    require("bufferline").setup {
        options = {
            number = "none",
            modified_icon = "✥",
            buffer_close_icon = "",
            left_trunc_marker = "",
            right_trunc_marker = "",
            max_name_length = 14,
            max_prefix_length = 13,
            tab_size = 20,
            show_buffer_close_icons = true,
            show_buffer_icons = true,
            show_tab_indicators = true,
            diagnostics = "nvim_lsp",
            always_show_bufferline = true,
            separator_style = "thin",
            offsets = {
                {
                    filetype = "NvimTree",
                    text = "File Explorer",
                    text_align = "center",
                    padding = 1
                }
            }
        }
    }
end

function config.gitsigns()
    require("gitsigns").setup {
        signs = {
            add = {
                hl = 'GitSignsAdd',
                text = '│',
                numhl = 'GitSignsAddNr',
                linehl = 'GitSignsAddLn'
            },
            change = {
                hl = 'GitSignsChange',
                text = '│',
                numhl = 'GitSignsChangeNr',
                linehl = 'GitSignsChangeLn'
            },
            delete = {
                hl = 'GitSignsDelete',
                text = '_',
                numhl = 'GitSignsDeleteNr',
                linehl = 'GitSignsDeleteLn'
            },
            topdelete = {
                hl = 'GitSignsDelete',
                text = '‾',
                numhl = 'GitSignsDeleteNr',
                linehl = 'GitSignsDeleteLn'
            },
            changedelete = {
                hl = 'GitSignsChange',
                text = '~',
                numhl = 'GitSignsChangeNr',
                linehl = 'GitSignsChangeLn'
            }
        },
        keymaps = {
            -- Default keymap options
            noremap = true,
            buffer = true,
            ["n ]g"] = {
                expr = true,
                '&diff ? \']g\' : \'<cmd>lua require"gitsigns".next_hunk()<CR>\''
            },
            ["n [g"] = {
                expr = true,
                '&diff ? \'[g\' : \'<cmd>lua require"gitsigns".prev_hunk()<CR>\''
            },
            ["n <leader>hs"] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
            ["v <leader>hs"] = '<cmd>lua require"gitsigns".stage_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
            ["n <leader>hu"] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
            ["n <leader>hr"] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
            ["v <leader>hr"] = '<cmd>lua require"gitsigns".reset_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
            ["n <leader>hR"] = '<cmd>lua require"gitsigns".reset_buffer()<CR>',
            ["n <leader>hp"] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
            ["n <leader>hb"] = '<cmd>lua require"gitsigns".blame_line(true)<CR>',
            -- Text objects
            ["o ih"] = ':<C-U>lua require"gitsigns".text_object()<CR>',
            ["x ih"] = ':<C-U>lua require"gitsigns".text_object()<CR>'
        },
        watch_gitdir = {interval = 1000, follow_files = true},
        current_line_blame = true,
        current_line_blame_opts = {delay = 1000, virtual_text_pos = "eol"},
        sign_priority = 6,
        update_debounce = 100,
        status_formatter = nil, -- Use default
        word_diff = false,
        diff_opts = {internal = true}
    }
end

function config.indent_blankline()
    vim.opt.termguicolors = true
    -- vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
    -- vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
    -- vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
    -- vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
    -- vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
    -- vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]

    vim.opt.list = true
    require("indent_blankline").setup {
        char = "│",
        show_first_indent_level = true,
        filetype_exclude = {
            "startify", "dashboard", "dotooagenda", "log", "fugitive",
            "gitcommit", "packer", "vimwiki", "markdown", "json", "txt",
            "vista", "help", "todoist", "NvimTree", "peekaboo", "git",
            "TelescopePrompt", "undotree", "flutterToolsOutline", "" -- for all buffers without a file type
        },
        buftype_exclude = {"terminal", "nofile"},
        show_trailing_blankline_indent = false,
        show_current_context = true,
        context_patterns = {
            "class", "function", "method", "block", "list_literal", "selector",
            "^if", "^table", "if_statement", "while", "for", "type", "var",
            "import"
        },
        -- char_highlight_list = {
        --     "IndentBlanklineIndent1",
        --     "IndentBlanklineIndent2",
        --     "IndentBlanklineIndent3",
        --     "IndentBlanklineIndent4",
        --     "IndentBlanklineIndent5",
        --     "IndentBlanklineIndent6",
        -- },
        space_char_blankline = " "
    }
end

function config.gruvbox()
    vim.g.gruvbox_contrast_dark = 'hard'
    vim.cmd [[colorscheme gruvbox]]
    vim.cmd [[highlight link Operator GruvboxRed]]
    vim.cmd [[highlight link CocExplorerFileDiagnosticWarning None]]
    vim.cmd [[highlight link CocExplorerFileDiagnosticError None]]
    vim.cmd [[highlight link TelescopeSelection SignColumn]]
end

return config
