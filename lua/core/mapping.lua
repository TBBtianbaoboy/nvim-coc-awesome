local bind = require("keymap.bind")
local map_cr = bind.map_cr
local map_cmd = bind.map_cmd

-- default map
local def_map = {
    -- Vim map
    ["n|Y"] = map_cmd("y$"),
    ["n|D"] = map_cmd("d$"),
    ["n|H"] = map_cmd("^"),
    ["n|L"] = map_cmd("g_"),
    ["n|n"] = map_cmd("nzzzv"):with_noremap(),
    ["n|N"] = map_cmd("Nzzzv"):with_noremap(),
    ["n|J"] = map_cmd("mzJ`z"):with_noremap(), -- 将下一行移动到当前行尾
    -- Windows jump
    ["n|<C-h>"] = map_cmd("<C-w>h"):with_noremap(),-- C 表示Ctrl键
    ["n|<C-l>"] = map_cmd("<C-w>l"):with_noremap(),
    ["n|<C-j>"] = map_cmd("<C-w>j"):with_noremap(),
    ["n|<C-k>"] = map_cmd("<C-w>k"):with_noremap(),
    ["n|<leader>q"] = map_cmd(":q!<CR>"),
    ["n|<leader>w"] = map_cmd(":w<CR>"),
    -- 开启英文单词正确性校验
    ["n|<leader>o"] = map_cr("setlocal spell! spelllang=en_us"),
    -- 插入模式的快捷键---------------------------------------------------------------------------ok
    ["i|<C-u>"] = map_cmd("<C-G>u<C-U>"):with_noremap(), -- 删除当行光标前内容
    ["i|<C-b>"] = map_cmd("<Left>"):with_noremap(), -- 光标向行首移动
    ["i|<C-a>"] = map_cmd("<Esc>^i"):with_noremap(), -- 光标跳转到行首
    ["i|<C-e>"] = map_cmd("<End>"):with_noremap(), -- 光标跳转到行尾
    ["i|<C-f>"] = map_cmd("<Right>"):with_noremap(), -- 光标向行尾移动
    ["i|<C-d>"] = map_cmd("<Del>"):with_noremap(), -- 光标向后删除-- 另外<C-h> 是光标向前删除
    ["i|<C-k>"] = map_cmd("()<Esc>i"):with_noremap(), -- 增加()
    -- command line
    ["c|<C-b>"] = map_cmd("<Left>"):with_noremap(),
    ["c|<C-f>"] = map_cmd("<Right>"):with_noremap(),
    ["c|<C-a>"] = map_cmd("<Home>"):with_noremap(),
    ["c|<C-e>"] = map_cmd("<End>"):with_noremap(),
    ["c|<C-d>"] = map_cmd("<Del>"):with_noremap(),
    ["c|<C-h>"] = map_cmd("<BS>"):with_noremap(),
    ["c|<C-p>"] = map_cmd("<Up>"):with_noremap(),
    ["c|<C-t>"] = map_cmd([[<C-R>=expand("%:p:h") . "/" <CR>]]):with_noremap(),
    ["c|<C-n>"] = map_cmd("<Down>"):with_noremap(),
    ["c|w!!"] = map_cmd(
        "execute 'silent! write !sudo tee % >/dev/null' <bar> edit!"),
    -- Visual
    ["v|J"] = map_cmd(":m '>+1<cr>gv=gv"),
    ["v|K"] = map_cmd(":m '<-2<cr>gv=gv"),
    ["v|H"] = map_cmd("^"),
    ["v|L"] = map_cmd("g_"),
    ["v|<"] = map_cmd("<gv"),
    ["v|>"] = map_cmd(">gv"),
    -- 摒弃上下左右键
    ["i|<Up>"] = map_cmd("<Nop>"):with_noremap(),
    ["i|<Down>"] = map_cmd("<Nop>"):with_noremap(),
    ["i|<Left>"] = map_cmd("<Nop>"):with_noremap(),
    ["i|<Right>"] = map_cmd("<Nop>"):with_noremap(),
    ["v|<Up>"] = map_cmd("<Nop>"):with_noremap(),
    ["v|<Down>"] = map_cmd("<Nop>"):with_noremap(),
    ["v|<Left>"] = map_cmd("<Nop>"):with_noremap(),
    ["v|<Right>"] = map_cmd("<Nop>"):with_noremap(),
    ["c|<Up>"] = map_cmd("<Nop>"),
    ["c|<Down>"] = map_cmd("<Nop>"),
    ["c|<Left>"] = map_cmd("<Nop>"),
    ["c|<Right>"] = map_cmd("<Nop>"),
    -- 将<space>映射成<leader>
    ["n|<Space>"] = map_cmd(";"),
    -- Windows split
    ["n|s"] = map_cmd("<Nop>"),
    ["n|sv"] = map_cmd(":vsplit<CR>"),
    ["n|sh"] = map_cmd(":split<CR>"),
    ["n|st"] = map_cmd(":tabnew<CR>"),
    ["n|<Left>"] = map_cmd(":vertical res-5<CR>"),
    ["n|<Right>"] = map_cmd(":vertical res+5<CR>"),
    ["n|<Up>"] = map_cmd(":res-5<CR>"),
    ["n|<Down>"] = map_cmd(":res+5<CR>"),
    -- move quickly
    -- ["n|<C-j>"] = map_cmd("5j"),
    -- ["n|<C-k>"] = map_cmd("5k"),
    -- ["n|<C-h>"] = map_cmd("5h"),
    -- ["n|<C-l>"] = map_cmd("5l"),
}

bind.nvim_load_mapping(def_map)
