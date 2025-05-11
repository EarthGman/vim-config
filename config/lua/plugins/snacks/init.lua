local wk = require("which-key")

require("snacks").setup({
	picker = require("plugins.snacks.picker"),
	explorer = require("plugins.snacks.explorer"),
	dashboard = require("plugins.snacks.dashboard"),
})

local picker = Snacks.picker
wk.add({
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
})
