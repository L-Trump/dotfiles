local bind = require("keymap.bind")
local map_cr = bind.map_cr
local map_cmd = bind.map_cmd
local map_callback = bind.map_callback
local et = bind.escape_termcode

local plug_map = {
    -- 窗口
	["n|<F12>"] = map_cr("MarkdownPreviewToggle"):with_noremap():with_silent():with_desc("tool: Preview markdown"),
    ["n|<leader>sv"] = map_cr("sp"):with_desc("Window: split horizontally"), -- 水平新建窗口
    ["n|<leader>sh"] = map_cr("vs"):with_desc("Window: split vertically"), -- 垂直新建窗口

    -- 取消高亮
    ["n|<leader>nh"] = map_cr("nohl"):with_silent():with_desc("Tool: cancel highlight"),

    -- nvim-tree
	["n|<leader>e"] = map_cr("NvimTreeToggle"):with_noremap():with_silent():with_desc("filetree: Toggle"),

    -- 全选
	["n|<leader>a"] = map_cmd("ggVG"):with_noremap():with_silent():with_desc("Editor: Select All"),
	["n|<C-a>"] = map_cmd("ggVG"):with_noremap():with_silent():with_desc("Editor: Select All"),

    -- Buffer 控制
	["n|<leader>q"] = map_cr("BufDel"):with_noremap():with_silent():with_desc("buffer: Close current"),
	["n|<S-l>"] = map_cr("BufferLineCycleNext"):with_noremap():with_silent():with_desc("buffer: Switch to next"),
	["n|<S-h>"] = map_cr("BufferLineCyclePrev"):with_noremap():with_silent():with_desc("buffer: Switch to prev"),
	["n|<A-S-l>"] = map_cr("BufferLineMoveNext"):with_noremap():with_silent():with_desc("buffer: Move current to next"),
	["n|<A-S-h>"] = map_cr("BufferLineMovePrev"):with_noremap():with_silent():with_desc("buffer: Move current to prev"),

    -- Comment
	["n|<C-_>"] = map_callback(function()
			return vim.v.count == 0 and et("<Plug>(comment_toggle_linewise_current)")
				or et("<Plug>(comment_toggle_linewise_count)")
		end)
		:with_silent()
		:with_noremap()
		:with_expr()
		:with_desc("edit: Toggle comment for line"),
	["x|<C-_>"] = map_cmd("<Plug>(comment_toggle_linewise_visual)gv")
		:with_silent()
		:with_noremap()
		:with_desc("edit: Toggle comment for line with selection"),

    -- 使用符号包裹 - VISUAL
    ['v|<leader>"'] = map_cmd('"5c"<C-r>""<ESC>'):with_silent():with_desc('editor: embrace with ""'),
    ['v|<leader>\''] = map_cmd("\"5c'<C-r>\"'<ESC>"):with_silent():with_desc("editor: embrace with ''"),
    -- 取消符号包裹 - VISUAL
    ['v|<leader><leader>"'] = map_cmd('a"l:s/\\%V"\\(\\_.*\\)"\\%V/\\1/g<CR>gvhh<ESC>'):with_silent():with_desc('editor: cancel embrace ""'),
    ["v|<leader><leader>'"] = map_cmd('a\'l:s/\\%V\'\\(\\_.*\\)\'\\%V/\\1/g<CR>gvhh<ESC>'):with_silent():with_desc('editor: cancel embrace \'\''),
    -- 打开终端
	["n|<leader>tm"] = map_cmd("<Cmd>ToggleTerm<CR>"):with_noremap():with_silent():with_desc("terminal: Toggle horizontal"),
}

bind.nvim_load_mapping(plug_map)
