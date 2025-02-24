local wk = require("which-key")
local ui = require("harpoon.ui")
local mark = require("harpoon.mark")
-- local picker = Snacks.picker
local telescope = require("telescope.builtin")

wk.add({
	-- globals
	{
		mode = { "n", "v" },
		{ "<leader>q", "<cmd>q<cr>", desc = "Quit" },
		{ "<leader>w", "<cmd>w<cr>", desc = "Write" },
	},
	{ "<leader>pv",      "<cmd>Ex<cr>",                 desc = "Project View" },
	{ "<leader>vs",      "<cmd>vsplit<cr>",             desc = "Vertical Split" },
	{ "<leader>hs",      "<cmd>sp<cr>",                 desc = "Horizontal Split" },
	{ "<leader>bd",      "<cmd>bd<cr>",                 desc = "Buffer Delete" },
	{ "<A-h>",           proxy = "<C-w>h",              desc = "Focus Split Left" },
	{ "<A-j>",           proxy = "<C-w>j",              desc = "Focus Split Down" },
	{ "<A-k>",           proxy = "<C-w>k",              desc = "Focus Split Up" },
	{ "<A-l>",           proxy = "<C-w>l",              desc = "Focus Split Right" },

	-- telescope
	{ "<leader><Space>", telescope.find_files,          desc = "Find Files" },
	{ "<leader>fb",      telescope.buffers,             desc = "Find Buffers" },
	{ "<leader>lg",      telescope.live_grep,           desc = "Live Grep" },

	-- { "<leader><Space>", picker.smart,                  desc = "Find Files" },
	-- { "<leader>fb",      picker.buffers,                desc = "Find Buffers" },
	-- { "<leader>lg",      picker.grep,                   desc = "Live Grep" },
	-- { "<leader>ch",      picker.command_history,        desc = "Command History" },

	-- harpoon keymap
	{ "<leader>a",       mark.add_file,                 desc = "Add file to Harpoon" },
	{ "<leader>hm",      ui.toggle_quick_menu,          desc = "Harpoon Menu" },
	{ "<C-1>",           function() ui.nav_file(1) end, desc = "Harpoon Entry 1" },
	{ "<C-2>",           function() ui.nav_file(2) end, desc = "Harpoon Entry 2" },
	{ "<C-3>",           function() ui.nav_file(3) end, desc = "Harpoon Entry 3" },
	{ "<C-4>",           function() ui.nav_file(4) end, desc = "Harpoon Entry 4" },

	-- undotree
	{ "<leader>u",       "<cmd>UndotreeToggle<cr>",     desc = "Undotree Toggle" },
})
