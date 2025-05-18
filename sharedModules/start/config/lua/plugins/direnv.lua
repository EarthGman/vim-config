require("direnv").setup({
	-- Whether to automatically load direnv when entering a directory with .envrc
	autoload_direnv = false,

	-- Statusline integration
	statusline = {
		-- Enable statusline component
		enabled = false,
		-- Icon to display in statusline
		icon = "󱚟",
	},

	-- Keyboard mappings
	keybindings = {
		allow = "<Leader>da",
		deny = "<Leader>dd",
		reload = "<Leader>dr",
		edit = "<Leader>de",
	},

	-- Notification settings
	notifications = {
		-- Log level (vim.log.levels.INFO, ERROR, etc.)
		level = vim.log.levels.INFO,
		-- Don't show notifications during autoload
		silent_autoload = true,
	},
})
