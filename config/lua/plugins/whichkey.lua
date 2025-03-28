local wk = require("which-key")
local ui = require("harpoon.ui")
local mark = require("harpoon.mark")
local picker = require("snacks").picker
-- local tsc = require("treesitter-context"

wk.add({
	-- globals
	{
		mode = { "n", "v" },
		{ "<leader>q", "<cmd>q<cr>", desc = "Quit" },
		{ "<leader>w", "<cmd>w<cr>", desc = "Write" },
	},
	{ "<leader>vs",      "<cmd>vsplit<cr>",                desc = "Vertical Split" },
	{ "<leader>hs",      "<cmd>sp<cr>",                    desc = "Horizontal Split" },
	{ "<leader>bd",      "<cmd>bd<cr>",                    desc = "Buffer Delete" },
	{ "<leader>x",       "<cmd>x<cr>",                     desc = "Save and Quit" },
	{ "<leader>vt",      "<cmd>vert term<cr>",             desc = "Vertical Terminal" },
	{ "<A-h>",           proxy = "<C-w>h",                 desc = "Focus Split Left" },
	{ "<A-j>",           proxy = "<C-w>j",                 desc = "Focus Split Down" },
	{ "<A-k>",           proxy = "<C-w>k",                 desc = "Focus Split Up" },
	{ "<A-l>",           proxy = "<C-w>l",                 desc = "Focus Split Right" },

	-- picker
	{ "<leader><Space>", picker.files,                     desc = "Find Files" },
	{ "<leader>fb",      picker.buffers,                   desc = "Find Buffers" },
	{ "<leader>/",       picker.grep,                      desc = "Grep Files" },
	{ "<leader>ch",      picker.command_history,           desc = "Command History" },
	{ "<leader>fp",      picker.projects,                  desc = "Find Projects" },
	{ "<leader>lk",      picker.keymaps,                   desc = "List Keymaps" },
	{ "<leader>uh",      picker.undo,                      desc = "Undo History" },
	{ "<leader>ct",      picker.colorschemes,              desc = "Change Theme" },
	{ "<leader>lg",      function() Snacks.lazygit() end,  desc = "Lazygit" },
	{ "<leader>e",       function() Snacks.explorer() end, desc = "File Explorer" },

	-- harpoon keymap
	{ "<leader>a",       mark.add_file,                    desc = "Add file to Harpoon" },
	{ "<leader>hm",      ui.toggle_quick_menu,             desc = "Harpoon Menu" },
	{ "<C-1>",           function() ui.nav_file(1) end,    desc = "Harpoon Entry 1" },
	{ "<C-2>",           function() ui.nav_file(2) end,    desc = "Harpoon Entry 2" },
	{ "<C-3>",           function() ui.nav_file(3) end,    desc = "Harpoon Entry 3" },
	{ "<C-4>",           function() ui.nav_file(4) end,    desc = "Harpoon Entry 4" },
})
