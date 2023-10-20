local config = {}

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

-- function config.nvim_bufferline()
--     require("bufferline").setup {
--         options = {
--             number = "none",
--             modified_icon = "✥",
--             buffer_close_icon = "",
--             left_trunc_marker = "",
--             right_trunc_marker = "",
--             max_name_length = 14,
--             max_prefix_length = 13,
--             tab_size = 20,
--             show_buffer_close_icons = true,
--             show_buffer_icons = true,
--             show_tab_indicators = true,
--             diagnostics = "nvim_lsp",
--             always_show_bufferline = true,
--             separator_style = "thin",
--             offsets = {
--                 {
--                     filetype = "NvimTree",
--                     text = "File Explorer",
--                     text_align = "center",
--                     padding = 1
--                 }
--             }
--         }
--     }
-- end

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
    local highlight = {
        "RainbowRed",
        "RainbowYellow",
        "RainbowBlue",
        "RainbowOrange",
        "RainbowGreen",
        "RainbowViolet",
        "RainbowCyan",
    }
    local hooks = require "ibl.hooks"
    -- create the highlight groups in the highlight setup hook, so they are reset
    -- every time the colorscheme changes
    hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
        vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
        vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
        vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
        vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
        vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
        vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
        vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
    end)

    vim.g.rainbow_delimiters = { highlight = highlight }
    require("ibl").setup { scope = { highlight = highlight } }

    hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
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
