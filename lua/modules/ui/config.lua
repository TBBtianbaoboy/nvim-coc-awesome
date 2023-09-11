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
    local symbols_outline = {
        sections = {
            lualine_a = { 'mode' },
            lualine_b = { 'filetype' },
            lualine_c = {},
            lualine_x = {},
            lualine_y = {},
            lualine_z = { 'location' }
        },
        filetypes = { 'Outline' }
    }

    require("lualine").setup {
        options = {
            icons_enabled = true,
            theme = "gruvbox",
            disabled_filetypes = {},
            component_separators = "|",
            section_separators = { left = "", right = "" }
        },
        sections = {
            lualine_a = { "mode" },
            lualine_b = { { "branch" }, { "diff" } },
            lualine_c = {
                { "lsp_progress" }
            },
            lualine_x = {
                {
                    "diagnostics",
                    sources = { 'nvim_diagnostic' },
                    symbols = { error = " ", warn = " ", info = " " }
                }
            },
            lualine_y = { "filetype", "encoding", "fileformat" },
            lualine_z = { "progress", "location" }
        },
        inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = { "filename" },
            lualine_x = { "location" },
            lualine_y = {},
            lualine_z = {}
        },
        tabline = {},
        extensions = {
            "quickfix", "nvim-tree", "toggleterm", "fugitive", symbols_outline
        }
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
                text = 'A',
                numhl = 'GitSignsAddNr',
                linehl = 'GitSignsAddLn'
            },
            change = {
                hl = 'GitSignsChange',
                text = 'M',
                numhl = 'GitSignsChangeNr',
                linehl = 'GitSignsChangeLn'
            },
            delete = {
                hl = 'GitSignsDelete',
                text = 'D',
                numhl = 'GitSignsDeleteNr',
                linehl = 'GitSignsDeleteLn'
            },
            topdelete = {
                hl = 'GitSignsDelete',
                text = 'D',
                numhl = 'GitSignsDeleteNr',
                linehl = 'GitSignsDeleteLn'
            },
            changedelete = {
                hl = 'GitSignsChange',
                text = 'D',
                numhl = 'GitSignsChangeNr',
                linehl = 'GitSignsChangeLn'
            }
        },
        -- keymaps = {
        --     -- Default keymap options
        --     noremap = true,
        --     buffer = true,
        --     ["n ]g"] = {
        --         expr = true,
        --         '&diff ? \']g\' : \'<cmd>lua require"gitsigns".next_hunk()<CR>\''
        --     },
        --     ["n [g"] = {
        --         expr = true,
        --         '&diff ? \'[g\' : \'<cmd>lua require"gitsigns".prev_hunk()<CR>\''
        --     },
        --     ["n <leader>hs"] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
        --     ["v <leader>hs"] = '<cmd>lua require"gitsigns".stage_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
        --     ["n <leader>hu"] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
        --     ["n <leader>hr"] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
        --     ["v <leader>hr"] = '<cmd>lua require"gitsigns".reset_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
        --     ["n <leader>hR"] = '<cmd>lua require"gitsigns".reset_buffer()<CR>',
        --     ["n <leader>hp"] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
        --     ["n <leader>hb"] = '<cmd>lua require"gitsigns".blame_line(true)<CR>',
        --     -- Text objects
        --     ["o ih"] = ':<C-U>lua require"gitsigns".text_object()<CR>',
        --     ["x ih"] = ':<C-U>lua require"gitsigns".text_object()<CR>'
        -- },
        watch_gitdir = { interval = 1000, follow_files = true },
        current_line_blame = true,
        current_line_blame_opts = { delay = 1000, virtual_text_pos = "eol" },
        sign_priority = 6,
        update_debounce = 100,
        status_formatter = nil, -- Use default
        word_diff = false,
        diff_opts = { internal = true }
    }
end

function config.indent_blankline()
    vim.opt.termguicolors = true
    vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
    vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
    vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
    vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
    vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
    vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]

    vim.opt.list = true
    vim.opt.listchars:append "space:⋅"
    vim.opt.listchars:append "eol:↴"

    require("indent_blankline").setup {
        space_char_blankline = " ",
        char_highlight_list = {
            "IndentBlanklineIndent1",
            "IndentBlanklineIndent2",
            "IndentBlanklineIndent3",
            "IndentBlanklineIndent4",
            "IndentBlanklineIndent5",
            "IndentBlanklineIndent6",
        },
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

function config.NeoSolarized()
    local ok_status, NeoSolarized = pcall(require, "NeoSolarized")

    if not ok_status then
        return
    end

    -- Default Setting for NeoSolarized

    NeoSolarized.setup {
        style = "dark",         -- "dark" or "light"
        transparent = true,     -- true/false
        terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
        enable_italics = true,  -- Italics for different hightlight groups (eg. Statement, Condition, Comment, Include, etc.)
        styles = {
            -- Style for different style groups
            comments = { italic = true },
            keywords = { italic = true },
            functions = { bold = true },
            variables = {},
            string = { italic = true },
            underline = true, -- true/false; for global underline
            undercurl = true, -- true/false; for global undercurl
        },
    }
end

return config
